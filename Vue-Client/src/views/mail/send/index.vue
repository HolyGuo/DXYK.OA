<template>
  <div class="app-container calendar-list-container">
    <el-row :gutter="10">
      <el-col :span="2">
        <el-tag class="target-label" color="#36c6d3">
          <font color="#fff">收件人<icon-svg icon-class="add-user4" class="add-user"/></font>
        </el-tag>
      </el-col>
      <el-col :span="20">
        <multiselect
          v-model="target"
          :options="contacts"
          :multiple="true"
          :taggable="true"
          @tag="addContact"
          :clear-on-select="false"
          :hide-target="true"
          placeholder="请选择或输入联系人"
          label="name"
          track-by="id"
        ></multiselect>
      </el-col>
      <el-col :span="2">
        <el-button type="danger" @click="cleanTarget">清空</el-button>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="2">
        <el-tag class="target-label" color="#36c6d3">
          <font color="#fff">主题</font>
        </el-tag>
      </el-col>
      <el-col :span="20">
        <el-input v-model="mail.title" placeholder="请输入主题"></el-input>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-upload
          class="upload-file"
          ref="upload"
          :before-upload="handleBefore"
          :on-preview="handlePreview"
          :on-success="handleSuccess"
          :on-remove="handleRemove"
          :show-file-list="true"
          :file-list="mail.oldFileList"
          drag
          action="#"
          multiple
        >
          <i class="el-icon-upload"></i>
          <i class="el-upload__text">
            将文件拖到此处，或
            <em>点击上传</em>
          </i>
        </el-upload>
        <ul v-show="!!mail.oldFileList.length" class="old-file-list"></ul>
      </el-col>
    </el-row>
    <div class="editor-container">
      <el-input v-model="mail.content" type="textarea" :rows="7" placeholder="请输入内容" style="width:1000px;">
      </el-input>
    </div>
    <el-row>
      <el-col :span="12" :offset="9">
        <el-button type="primary" @click="sendSubmit">发送</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as users from '@/api/users'
import * as mailAPI from '@/api/mail';
import { isEmail, isEmpty, getType } from '@/utils/validate';
import { getNowFormatDate, parseTime } from '@/utils/index';
import { mapGetters } from 'vuex';
import axios from 'axios'
export default {
  name: 'mail_send',
  data() {
    return {
      loading: true,
      mail: {
        title: '',
        oldFileList: [],
        oldAudioList: [],
        content: '',
        target: [],
        copy: [],
        fileList: [],
        audioList: []
      },
      date: '',
      target: [],
      copy: [],
      isRecording: false,
      recorder: null,
      contacts: [],
      editorId: 'mail_send_ediotr',
      editorHeight: '400px',
      editorWidth: '200px',
      timing: '',
      listQuery: { // 查询条件
        page: 1,
        limit: 20,
        orgId: '',
        key: undefined
      },
      attachs: []
    };
  },
  computed: {
    ...mapGetters([
      'token'
    ])
  },
  created() {
    this.initSendPage();
    this.getContent();
  },
  methods: {
    initSendPage() {
      users.getList(this.listQuery).then(res => {
        this.contacts = res.data;
      });
      this.editorHeight = window.innerHeight - 420;
    },
    addContact(newTag) {
      if (!isEmail(newTag)) {
        this.$message({
          showClose: true,
          message: '输入的邮箱不合法',
          type: 'warning',
          duration: 1200
        });
        return;
      }
      const tag = {
        name: newTag,
        show: newTag,
        mail: newTag
      };
      this.contacts.push(tag);
      this.target.push(tag);
    },
    getContent() {
      const pageType = this.$store.getters.pageType;
      const mailId = this.$store.getters.mailId;
      const mailType = this.$store.getters.mailType;
      if (pageType && pageType !== 'add') {
        mailAPI.fetchMailDetail(mailId).then(res => {
          // 设定字段时要慎重，两边字段不匹配好累啊
          const detail = res.result;
          this.mail.title = detail.title;
          this.mail.content = detail.content;
          // 收件人
          let receiveStr = '';
          let copyStr = '';
          const sender = {
            name: '',
            id: ''
          };
          mailAPI.fetchReceiver(mailId).then(res => {
            this.mail.target.push(res.result[0].sender_id)
            const tag = {
              name: res.result[0].sender_name,
              id: res.result[0].sender_id
            };
            this.contacts.push(tag);
            this.target.push(tag);
            res.result.forEach(item => {
              receiveStr += item.receiver_name + ';';
            });
            // 查找附件
            mailAPI.fetchAttach(res.result[0].attachment_ids).then(res => {
              res.result.forEach(item => {
                item.name = item.file_name;
              });
              this.mail.oldFileList = res.result;
            });
          });
          
          this.date = detail.send_time;
          
          switch (pageType) {
            case 'reply':
              this.mail.title = '回复：' + this.mail.title;
              break;
            case 'replyAll':
              this.mail.title = '回复：' + this.mail.title;
              break;
            case 'edit':
              this.target = detail.target;
              this.copy = detail.copy;
              break;
            case 'forward':
              this.mail.title = '转发' + this.mail.title;
              this.addContentHeader(sender.neme, receiveStr, copyStr);
              break;
            default:
          }
        });
      } else if (pageType && pageType === 'add') {
        const target = this.$store.getters.target;
        if (target) {
          if (target === 'all') {
            this.target = this.contacts;
          } else {
            target.forEach(
              item => (item.show = item.name + '<' + item.mail + '>')
            );
            this.target = target;
          }
          this.$store.commit('SET_TARGET', null);
        }
      }
    },
    addContentHeader(sender, receiveStr, copyStr) {
      const header = `<p><span>------------------------ &nbsp; 原始邮件&nbsp;------------------------</span></p>
                <div style="background: #e4eaef"><br>
                <p>&nbsp;<strong>发件人:</strong>${sender}</p>
                <p>&nbsp;<strong>时间:&nbsp;&nbsp;&nbsp;</strong>${parseTime(
                  this.date
                )}</p>
                <p>&nbsp;<strong>收件人:</strong>${receiveStr}</p>
                <p>&nbsp;<strong>抄送:&nbsp;&nbsp;&nbsp;</strong>${copyStr}</p>
                <p>&nbsp;<strong>主题:&nbsp;&nbsp;&nbsp;</strong>${
                  this.mail.title
                }</p>
                <p><br/></p>
                </div>`;
      this.mail.content = header + this.mail.content;
    },
    cleanTarget() {
      this.target = [];
    },
    handleBefore(file) {
      // 上传前可以对要上传文件进行控制
      let param = new FormData(); //创建form对象
      param.append('file', file, file.name); //通过append向form对象添加数据
      //添加请求头
      let config = {
        headers: { 'X-Token': this.token }
      }; 
      var that = this
      axios.post('http://localhost:52789/api/mail/UploadFile', param, config)
        .then(response => {
          that.mail.fileList.push(response.data);
          that.mail.oldFileList.push(file);
        })
      return false
    },
    handleSuccess(file, fileInfo) {
      this.mail.fileList.push(fileInfo.name);
    },
    handlePreview(file) {
      // 预览,一些文件因为格式问题无法预览。推荐使用a标签，src为文件的下载地址，点击即可下载,参照录音
      window.open('http://192.168.173.33/wv/wordviewerframe.aspx?WOPISrc=http://192.168.173.32/wopi/files/' 
      + file.name + '&access_token=token&ui=zh-CN');
    },
    handleRemove(file) {
      // 移除
      this.mail.fileList.forEach((item, index) => {
        if (item.uuid === file.uid) {
          this.mail.fileList.splice(index, 1);
        }
      });
    },
    sendSubmit() {
      if (this.target.length < 1) {
        this.$message({
          showClose: true,
          message: '收件人不能为空',
          type: 'warning',
          duration: 1200
        });
        return;
      }
      // 添加到formData前应该根据需求处理数据
      this.target.forEach(item => {
        this.mail.target.push(item.id+'#'+item.name);
      });
      this.loading = true;
      mailAPI.sendMail(this.mail.title, this.mail.content, this.mail.target.join(','),
      this.mail.fileList.join(',')).then(res => {
          if(res.data != ''){
            this.$message({
              type: 'success',
              message: '发送成功',
              duration: 1200
            });
            this.loading = false;
            this.initMail();
          }
          else{
            this.$message({
              type: 'error',
              message: '发送失败',
              duration: 2000
            });
            this.loading = false;
          }
        });
    },
    initMail() {
      for (const field in this.mail) {
        if (getType(this.mail[field]) === 'String') {
          this.mail[field] = '';
        } else if (getType(this.mail[field]) === 'Array') {
          this.mail[field] = [];
        }
      }
      this.target = [];
      this.copy = [];
      // 编辑器内容与mail.content是双向绑定，上一步中mail.content = ''不知道为什么并没有将编辑器内容清空
      // tinymce.get(this.editorId).setContent('');
    }
  }
};
</script>

<style>
* {
  padding: 0;
  margin: 0;
}

ul {
  list-style: none;
}

audio {
  width: 260px;
}

.tool-bar {
  margin-top: -20px;
  margin-left: -20px;
}

.el-row {
  margin-bottom: 10px;
}

.target-label {
  font-size: 14px;
  padding: 0px 12px;
  margin: 2px 0;
  height: 35px;
  line-height: 35px;
}

.target-label i {
  margin-left: 3px;
}

.upload-file {
  display: inline-block;
  vertical-align: middle;
}

.el-upload-dragger {
  height: 30px;
}

.el-upload-dragger .el-icon-upload {
  font-size: 30px;
  line-height: 20px;
  margin: 3px 0;
}

.audio-name {
  width: 200px;
  vertical-align: 12px;
}

.audio-list > li {
  display: flex;
  align-items: center;
}

.del-audio {
  margin-left: 5px;
  cursor: pointer;
  vertical-align: 10px;
  font-size: 20px;
  color: #00adb5;
}

.send-btn {
  margin-top: 10px;
  margin-right: 60px;
}

.cancel-btn {
  margin-top: 10px;
}

.old-audio-name {
  vertical-align: 10px;
}
</style>

