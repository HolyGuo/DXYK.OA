<template>
    <div class="app-container calendar-list-container">
    
        <div class="filter-container">
    
            <el-button v-waves type="primary" icon="el-icon-edit" @click="edit" class="tool-item filter-item btn-edit"></el-button>
            <el-button v-waves type="primary" icon="el-icon-share" @click="forward" class="tool-item filter-item btn-forward"></el-button>
            <el-button v-waves type="danger" icon="el-icon-delete" class="tool-item filter-item btn-del" v-on:click="handleDelete()"></el-button>
            <el-button v-waves type="primary" class="tool-item filter-item btn-reload" v-on:click="initPage">
                <icon-svg icon-class="reload4"/>
            </el-button>
    
            <el-input @keyup.enter.native="handleFilter" style="width: 300px;" class="filter-item" placeholder="标题" v-model="listQuery.title">
            </el-input>
            <el-input @keyup.enter.native="handleFilter" style="width: 150px;" class="filter-item" placeholder="收件人" v-model="listQuery.receiveName">
            </el-input>
            <el-input @keyup.enter.native="handleFilter" style="width: 150px;" class="filter-item" placeholder="收件邮箱" v-model="listQuery.receiveMail">
            </el-input>
    
            <el-button class="filter-item" type="primary" v-waves icon="search" @click="handleFilter">搜索</el-button>
        </div>
    
        <el-table :key='tableKey' :data="list" ref="multipleTable" @sort-change="customSort" @selection-change="handleSelectionChange" v-loading.body="listLoading" border highlight-current-row style="width: 100%">
    
            <el-table-column type="selection" min-width="30px">
            </el-table-column>
    
            <el-table-column align="center" label="收件人" width="120px" :show-overflow-tooltip="true">
                <template scope="scope">
                    <span>{{ scope.row.receiver_name }}</span>
                </template>
            </el-table-column>
    
            <el-table-column prop="title" sortable="custom" label="主题" :show-overflow-tooltip="true" min-width="400px">
                <template scope="scope">
                    <span class="link-type" @click="goToDetail(scope.row.mail_id, scope.row.sender_name, scope.row.send_time, scope.row.attachment_ids)">
                        {{scope.row.mail_title}}
                    </span>
                </template>
            </el-table-column>
    
            <el-table-column prop="sendDate" sortable="custom" align="center" label="发送时间" width="150px">
                <template scope="scope">
                    <span>{{scope.row.send_time | parseTime('{y}-{m}-{d} {h}:{i}')}}</span>
                </template>
            </el-table-column>
    
        </el-table>
    
        <div v-show="!listLoading" class="pagination-container">
            <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page.sync="listQuery.page" :page-sizes="[10,20,30, 50]" :page-size="listQuery.limit" layout="total, sizes, prev, pager, next, jumper" :total="total">
            </el-pagination>
        </div>
    
    </div>
</template>

<script>
import * as mailAPI from '@/api/mail';
import { getType } from '@/utils/validate';
import { parseTime } from '@/utils';

export default {
    name: 'outbox',
    data() {
        return {
            list: null,
            total: null,
            listLoading: true,
            listQuery: {
                page: 1,
                limit: 20,
                keyWords: '',
                status: '',
                field: '',
                order: '',
                insession: '1'
            },
            multipleSelection: [],
            tableKey: 0,
            labelList: []
        }
    },
    created() {
        this.initPage();
    },
    methods: {
        initPage() {
            this.getList();
        },
        getList() {
            this.listLoading = true;
            mailAPI.GetInboxList(this.listQuery).then(response => {
                this.list = response.result.data;
                this.total = response.result.count;
                this.listLoading = false;
            })
        },
        handleFilter() {
            this.getList();
        },
        handleSizeChange(val) {
            this.listQuery.limit = val;
            this.getList();
        },
        handleCurrentChange(val) {
            this.listQuery.page = val;
            this.getList();
        },
        customSort(sortObj) {
            this.listQuery.sort = sortObj.prop;
            this.listQuery.order = sortObj.order;
            this.getList();
        },
        timeFilter(time) {
            if (!time[0]) {
                this.listQuery.start = undefined;
                this.listQuery.end = undefined;
                return;
            }
            this.listQuery.start = parseInt(+time[0] / 1000);
            this.listQuery.end = parseInt((+time[1] + 3600 * 1000 * 24) / 1000);
        },
        goToDetail(id, sender_name, send_time, attachment_ids) {
            this.$store.commit('SET_MAIL_ID', id);
            this.$store.commit('SET_MAIL_TYPE', 'send');
            this.$store.commit('SET_MAIL_SENDER', sender_name);
            this.$store.commit('SET_MAIL_SENDTIME', send_time);
            this.$store.commit('SET_MAIL_ATTACH', attachment_ids);
            this.$router.push({ path: '/mail/detail/index' });
        },
        edit() {
            const selectedLen = this.multipleSelection.length || 0;
            if (selectedLen !== 1) {
                this.$message('请选择一封邮件进行编辑');
                return;
            }
            this.$store.commit('SET_MAIL_ID', this.multipleSelection[0].mail_id);
            this.$store.commit('SET_PAGE_TYPE', 'edit');
            this.$store.commit('SET_MAIL_TYPE', 'send');
            this.$router.push({ path: '/mail/send/index' });
        },
        forward() {
            const selectedLen = this.multipleSelection.length || 0;
            if (selectedLen !== 1) {
                this.$message('请选择一封邮件进行转发');
                return;
            }
            this.$store.commit('SET_MAIL_ID', this.multipleSelection[0].id);
            this.$store.commit('SET_PAGE_TYPE', 'forward');
            this.$store.commit('SET_MAIL_TYPE', 'send');
            this.$router.push({ path: '/mail/send/index' });
        },
        handleSelectionChange(val) {
            this.multipleSelection = val;
        },
        handleDelete() {
            const selectedLen = this.multipleSelection.length || 0;
            if (selectedLen < 1) {
                this.$message('请选择邮件进行删除');
                return;
            }
            this.$confirm('是否删除这' + selectedLen + '封邮件?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const idArr = [];
                this.multipleSelection.forEach(item => idArr.push(item.id));
                mailAPI.delSendMail(idArr).subscribe({
                    next: () => {
                        this.$message({
                            message: '删除成功',
                            type: 'success',
                            duration: 2000
                        });
                        this.getList();
                    },
                    error: () => this.$message({
                        showClose: true,
                        message: '删除失败',
                        type: 'error'
                    })
                });
            }).catch(() => {
                this.$message('操作已取消');
            });
        },
        formatJson(filterVal, jsonData) {
            return jsonData.map(v => filterVal.map(j => {
                if (~j.indexOf('Date')) {
                    return parseTime(v[j])
                } else if (getType(v[j]) === 'Array') {
                    let str = '';
                    v[j].forEach(item => str += item.name + '<' + item.mail + '>;');
                    return str;
                } else {
                    return v[j]
                }
            }))
        }
    }
}
</script>

<style>

</style>
