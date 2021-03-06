<template>
  <Row type="flex" :gutter="20">
    <Col :span="containerSpan">
      <Panel shadow :padding="10" >
        <div slot="title">
          {{title}}
        </div>
        <div slot="extra">
          <Button v-if="listVisible" type="info" @click="init" :loading="btnLoading"><span class="ivu-icon ivu-icon-refresh"></span> {{$t('m.Refresh')}}</Button>
          <Button v-else icon="ios-undo" @click="goBack">{{$t('m.Back')}}</Button>
        </div>
        <transition-group name="announcement-animate" mode="in-out">
          <div class="no-announcement" v-if="!announcements.length" key="no-announcement">
            <p>{{$t('m.No_Announcements')}}</p>
          </div>
          <template v-if="listVisible">
            <ul class="announcements-container" key="list">
              <li v-for="announcement in announcements" :key="announcement.title">
                <div class="flex-container">
                  <div class="title"><a class="entry" @click="goAnnouncement(announcement)">
                    {{announcement.title}}</a></div>
                  <div class="date">{{announcement.create_time | localtime }}</div>
                  <div class="creator"> {{$t('m.By')}} {{announcement.created_by.username}}</div>
                </div>
              </li>
            </ul>
            <Pagination v-if="!isContest"
                        key="page"
                        :total="total"
                        :page-size="limit"
                        @on-change="getAnnouncementList">
            </Pagination>
          </template>

          <template v-else>
          <div v-katex v-html="announcement.content" key="content" class="content-container markdown-body"></div>
          </template>
        </transition-group>
      </Panel>
    </Col>
  </Row>
</template>

<script>
  import api from '@oj/api'
  import Pagination from '@oj/components/Pagination'
  import { mapState } from 'vuex'

  export default {
    name: 'Announcement',
    components: {
      Pagination
    },
    data () {
      return {
        limit: 10,
        total: 10,
        tagList: [],
        problemList: [],
        problemLimit: 15,
        query: {
          keyword: '',
          difficulty: '',
          tag: '',
          page: 1,
          orderby: '-create_time'
        },
        btnLoading: false,
        announcements: [],
        announcement: '',
        listVisible: true,
        timer: null,
        containerSpan: 24,
        SighinStatus: false,
        nowWeek: '',
        nowDate: '',
        word: '',
        days: 0
      }
    },
    /* mounted () {
      this.init()
      this.timer = setInterval(() => {
        this.setNowTimes()
      }, 1000)
      this.getWord()
      this.isSighin()
      this.getProblemList()
      this.getTagList()
    }, */
    methods: {
      init () {
        if (this.isContest) {
          this.containerSpan = 24
          this.getContestAnnouncementList()
        } else {
          this.getAnnouncementList()
        }
      },
      getTagList () {
        api.getProblemTagList().then(res => {
          this.tagList = res.data.data.sort((a, b) => {
            return a.id - b.id
          })
        })
      },
      getAnnouncementList (page = 1) {
        this.btnLoading = true
        api.getAnnouncementList((page - 1) * this.limit, this.limit).then(res => {
          this.btnLoading = false
          this.announcements = res.data.data.results
          this.total = res.data.data.total
        }, () => {
          this.btnLoading = false
        })
      },
      getContestAnnouncementList () {
        this.btnLoading = true
        api.getContestAnnouncementList(this.$route.params.contestID).then(res => {
          this.btnLoading = false
          this.announcements = res.data.data
        }, () => {
          this.btnLoading = false
        })
      },
      goAnnouncement (announcement) {
        this.announcement = announcement
        this.listVisible = false
      },
      goBack () {
        this.listVisible = true
        this.announcement = ''
      }
    },
    computed: {
      ...mapState(['website']),
      title () {
        if (this.listVisible) {
          return this.isContest ? this.$i18n.t('m.Contest_Announcements') : this.$i18n.t('m.Announcements')
        } else {
          return this.announcement.title
        }
      },
      isContest () {
        return !!this.$route.params.contestID
      }
    }
  }
</script>

<style scoped lang="less">
  .announcements-container {
    margin-top: -10px;
    margin-bottom: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.05), 0 6px 20px 0 rgba(0, 0, 0, 0.05);
    li {
      padding-top: 15px;
      list-style: none;
      padding-bottom: 15px;
      margin-left: 20px;
      font-size: 16px;
      border-bottom: 1px solid rgba(187, 187, 187, 0.5);
      &:last-child {
        border-bottom: none;
      }
      .flex-container {
        .title {
          flex: 1 1;
          text-align: left;
          padding-left: 10px;
          a.entry {
            color: #495060;
            &:hover {
              color: #2d8cf0;
              border-bottom: 1px solid #2d8cf0;
            }
          }
        }
        .creator {
          flex: none;
          width: 200px;
          text-align: center;
        }
        .date {
          flex: none;
          width: 200px;
          text-align: center;
        }
      }
    }
  }

  .content-container {
    padding: 0 20px 20px 20px;
  }

  .no-announcement {
    text-align: center;
    font-size: 16px;
  }changeLocale

  .announcement-animate-enter-active {
    color: rgba(255, 255, 255, 0.5);
    animation: fadeIn 1s;
  }
  /*.nowWeek {
    text-align: center;
    padding-top: 20px;
    font-size: 25px;
    font-weight: 600;
  }
  .nowDate {
    text-align: center;
    padding-bottom: 10px;
    font-size: 30px;
    font-weight: 600;
  }*/
  .tag-btn {
    margin-right: 10px;
    margin-bottom: 20px;
  }
  .tag-btn:hover {
    a {
       color: #2d8cf0;
    }
  }
  .link-style {
    color:#264c67
  }
  .link-style:hover {
    color: #2d8cf0;
  }
</style>
