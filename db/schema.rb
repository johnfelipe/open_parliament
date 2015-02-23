# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts_user", force: :cascade do |t|
    t.string   "email",          limit: 75,                                 null: false
    t.boolean  "email_bouncing",            default: false,                 null: false
    t.datetime "created",                   default: '2012-10-02 02:11:20', null: false
    t.datetime "last_login"
    t.text     "json_data",                 default: "{}",                  null: false
  end

  add_index "accounts_user", ["email"], name: "accounts_user_email_key", unique: true, using: :btree

  create_table "activity_activity", force: :cascade do |t|
    t.date    "date",                     null: false
    t.string  "variety",       limit: 15, null: false
    t.integer "politician_id",            null: false
    t.text    "payload",                  null: false
    t.string  "guid",          limit: 50, null: false
    t.boolean "active",                   null: false
  end

  add_index "activity_activity", ["active"], name: "activity_activity_active", using: :btree
  add_index "activity_activity", ["date"], name: "activity_activity_date", using: :btree
  add_index "activity_activity", ["guid"], name: "activity_activity_guid_key", unique: true, using: :btree
  add_index "activity_activity", ["politician_id"], name: "activity_activity_politician_id", using: :btree

  create_table "alerts_politicianalert", force: :cascade do |t|
    t.boolean  "active",                   default: false,                 null: false
    t.datetime "created",                  default: '2010-04-12 15:15:12', null: false
    t.integer  "politician_id",                                            null: false
    t.string   "email",         limit: 75,                                 null: false
  end

  add_index "alerts_politicianalert", ["politician_id"], name: "alerts_politicianalert_politician_id", using: :btree

  create_table "alerts_seenitem", force: :cascade do |t|
    t.integer  "topic_id",                                              null: false
    t.string   "item_id",   limit: 400,                                 null: false
    t.datetime "timestamp",             default: '2012-10-02 02:11:21', null: false
  end

  add_index "alerts_seenitem", ["item_id"], name: "alerts_seenitem_item_id", using: :btree
  add_index "alerts_seenitem", ["item_id"], name: "alerts_seenitem_item_id_like", using: :btree
  add_index "alerts_seenitem", ["topic_id", "item_id"], name: "alerts_seenitem_topic_id_6770f2926aa1ac78_uniq", unique: true, using: :btree
  add_index "alerts_seenitem", ["topic_id"], name: "alerts_seenitem_topic_id", using: :btree

  create_table "alerts_subscription", force: :cascade do |t|
    t.integer  "topic_id",                                  null: false
    t.integer  "user_id",                                   null: false
    t.datetime "created",   default: '2012-10-02 02:11:22', null: false
    t.boolean  "active",    default: true,                  null: false
    t.datetime "last_sent"
  end

  add_index "alerts_subscription", ["topic_id", "user_id"], name: "alerts_subscription_topic_id_3eafbc582f746a3_uniq", unique: true, using: :btree
  add_index "alerts_subscription", ["topic_id"], name: "alerts_subscription_topic_id", using: :btree
  add_index "alerts_subscription", ["user_id"], name: "alerts_subscription_user_id", using: :btree

  create_table "alerts_topic", force: :cascade do |t|
    t.string   "query",        limit: 800,                                 null: false
    t.datetime "created",                  default: '2012-10-02 02:11:21', null: false
    t.datetime "last_checked"
    t.datetime "last_found"
  end

  add_index "alerts_topic", ["query"], name: "alerts_topic_query_key", unique: true, using: :btree

  create_table "auth_group", force: :cascade do |t|
    t.string "name", limit: 80, null: false
  end

  add_index "auth_group", ["name"], name: "auth_group_name_key", unique: true, using: :btree

  create_table "auth_group_permissions", force: :cascade do |t|
    t.integer "group_id",      null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], name: "auth_group_permissions_group_id_key", unique: true, using: :btree
  add_index "auth_group_permissions", ["group_id"], name: "auth_group_permissions_group_id", using: :btree
  add_index "auth_group_permissions", ["permission_id"], name: "auth_group_permissions_permission_id", using: :btree

  create_table "auth_message", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text    "message", null: false
  end

  add_index "auth_message", ["user_id"], name: "auth_message_user_id", using: :btree

  create_table "auth_permission", force: :cascade do |t|
    t.string  "name",            limit: 50,  null: false
    t.integer "content_type_id",             null: false
    t.string  "codename",        limit: 100, null: false
  end

  add_index "auth_permission", ["content_type_id", "codename"], name: "auth_permission_content_type_id_key", unique: true, using: :btree
  add_index "auth_permission", ["content_type_id"], name: "auth_permission_content_type_id", using: :btree

  create_table "auth_user", force: :cascade do |t|
    t.string   "username",     limit: 30,  null: false
    t.string   "first_name",   limit: 30,  null: false
    t.string   "last_name",    limit: 30,  null: false
    t.string   "email",        limit: 75,  null: false
    t.string   "password",     limit: 128, null: false
    t.boolean  "is_staff",                 null: false
    t.boolean  "is_active",                null: false
    t.boolean  "is_superuser",             null: false
    t.datetime "last_login",               null: false
    t.datetime "date_joined",              null: false
  end

  add_index "auth_user", ["username"], name: "auth_user_username_key", unique: true, using: :btree

  create_table "auth_user_groups", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
  end

  add_index "auth_user_groups", ["group_id"], name: "auth_user_groups_group_id", using: :btree
  add_index "auth_user_groups", ["user_id", "group_id"], name: "auth_user_groups_user_id_key", unique: true, using: :btree
  add_index "auth_user_groups", ["user_id"], name: "auth_user_groups_user_id", using: :btree

  create_table "auth_user_user_permissions", force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
  end

  add_index "auth_user_user_permissions", ["permission_id"], name: "auth_user_user_permissions_permission_id", using: :btree
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_key", unique: true, using: :btree
  add_index "auth_user_user_permissions", ["user_id"], name: "auth_user_user_permissions_user_id", using: :btree

  create_table "bills_bill", force: :cascade do |t|
    t.text    "name_en",                          null: false
    t.string  "number",                limit: 10, null: false
    t.integer "number_only",           limit: 2,  null: false
    t.integer "sponsor_member_id"
    t.boolean "privatemember"
    t.integer "sponsor_politician_id"
    t.boolean "law"
    t.date    "added",                            null: false
    t.string  "institution",           limit: 1,  null: false
    t.text    "name_fr",                          null: false
    t.text    "short_title_en",                   null: false
    t.text    "short_title_fr",                   null: false
    t.date    "status_date"
    t.date    "introduced"
    t.integer "text_docid"
    t.string  "status_code",           limit: 50, null: false
  end

  add_index "bills_bill", ["added"], name: "bills_bill_added", using: :btree
  add_index "bills_bill", ["institution"], name: "bills_bill_institution", using: :btree
  add_index "bills_bill", ["institution"], name: "bills_bill_institution_like", using: :btree
  add_index "bills_bill", ["sponsor_member_id"], name: "bills_bill_sponsor_member_id", using: :btree
  add_index "bills_bill", ["sponsor_politician_id"], name: "bills_bill_sponsor_politician_id", using: :btree

  create_table "bills_billevent", force: :cascade do |t|
    t.integer "bis_id",                null: false
    t.date    "date",                  null: false
    t.integer "source_id",             null: false
    t.string  "institution", limit: 1, null: false
    t.text    "status_en",             null: false
    t.text    "status_fr",             null: false
    t.integer "debate_id"
  end

  add_index "bills_billevent", ["bis_id"], name: "bills_billevent_bis_id", using: :btree
  add_index "bills_billevent", ["date"], name: "bills_billevent_date", using: :btree
  add_index "bills_billevent", ["debate_id"], name: "bills_billevent_debate_id", using: :btree
  add_index "bills_billevent", ["source_id"], name: "bills_billevent_source_id_key", unique: true, using: :btree

  create_table "bills_billevent_committee_meetings", force: :cascade do |t|
    t.integer "billevent_id",        null: false
    t.integer "committeemeeting_id", null: false
  end

  add_index "bills_billevent_committee_meetings", ["billevent_id", "committeemeeting_id"], name: "bills_billevent_committee_me_billevent_id_6d29df52b38817f7_uniq", unique: true, using: :btree
  add_index "bills_billevent_committee_meetings", ["billevent_id"], name: "bills_billevent_committee_meetings_billevent_id", using: :btree
  add_index "bills_billevent_committee_meetings", ["committeemeeting_id"], name: "bills_billevent_committee_meetings_committeemeeting_id", using: :btree

  create_table "bills_billinsession", force: :cascade do |t|
    t.integer "bill_id",                         null: false
    t.string  "session_id",            limit: 4, null: false
    t.integer "legisinfo_id"
    t.date    "introduced"
    t.integer "sponsor_politician_id"
    t.integer "sponsor_member_id"
  end

  add_index "bills_billinsession", ["bill_id", "session_id"], name: "bills_bill_sessions_bill_id_1a3e0259_uniq", unique: true, using: :btree
  add_index "bills_billinsession", ["bill_id"], name: "bills_bill_sessions_bill_id", using: :btree
  add_index "bills_billinsession", ["introduced"], name: "bills_billinsession_introduced", using: :btree
  add_index "bills_billinsession", ["legisinfo_id"], name: "bills_billinsession_legisinfo_id", using: :btree
  add_index "bills_billinsession", ["session_id"], name: "bills_bill_sessions_session_id", using: :btree
  add_index "bills_billinsession", ["sponsor_member_id"], name: "bills_billinsession_sponsor_member_id", using: :btree
  add_index "bills_billinsession", ["sponsor_politician_id"], name: "bills_billinsession_sponsor_politician_id", using: :btree

  create_table "bills_billtext", force: :cascade do |t|
    t.integer  "bill_id",                                 null: false
    t.integer  "docid",                                   null: false
    t.datetime "created", default: '2012-10-05 21:47:51', null: false
    t.text     "text_en",                                 null: false
    t.text     "text_fr",                                 null: false
  end

  add_index "bills_billtext", ["bill_id"], name: "bills_billtext_bill_id", using: :btree
  add_index "bills_billtext", ["docid"], name: "bills_billtext_docid", using: :btree
  add_index "bills_billtext", ["docid"], name: "bills_billtext_docid_uniq", unique: true, using: :btree

  create_table "bills_membervote", force: :cascade do |t|
    t.integer "member_id",                 null: false
    t.integer "politician_id",             null: false
    t.integer "votequestion_id",           null: false
    t.string  "vote",            limit: 1, null: false
    t.boolean "dissent",                   null: false
  end

  add_index "bills_membervote", ["dissent"], name: "bills_membervote_dissent", using: :btree
  add_index "bills_membervote", ["member_id"], name: "bills_membervote_member_id", using: :btree
  add_index "bills_membervote", ["politician_id"], name: "bills_membervote_politician_id", using: :btree
  add_index "bills_membervote", ["votequestion_id"], name: "bills_membervote_votequestion_id", using: :btree

  create_table "bills_partyvote", force: :cascade do |t|
    t.string  "vote",            limit: 1, null: false
    t.integer "party_id",                  null: false
    t.integer "votequestion_id",           null: false
    t.float   "disagreement"
  end

  add_index "bills_partyvote", ["party_id", "votequestion_id"], name: "bills_partyvote_party_id_3db5377c11c3b9f1_uniq", unique: true, using: :btree
  add_index "bills_partyvote", ["party_id"], name: "bills_partyvote_party_id", using: :btree
  add_index "bills_partyvote", ["votequestion_id"], name: "bills_partyvote_votequestion_id", using: :btree

  create_table "bills_votequestion", force: :cascade do |t|
    t.text    "description_en",                 null: false
    t.integer "nay_total",            limit: 2, null: false
    t.integer "bill_id"
    t.integer "paired_total",         limit: 2, null: false
    t.integer "number",                         null: false
    t.string  "session_id",           limit: 4, null: false
    t.string  "result",               limit: 1, null: false
    t.date    "date",                           null: false
    t.integer "yea_total",            limit: 2, null: false
    t.integer "context_statement_id"
    t.text    "description_fr",                 null: false
  end

  add_index "bills_votequestion", ["bill_id"], name: "bills_votequestion_bill_id", using: :btree
  add_index "bills_votequestion", ["context_statement_id"], name: "bills_votequestion_context_statement_id", using: :btree
  add_index "bills_votequestion", ["date"], name: "bills_votequestion_date", using: :btree
  add_index "bills_votequestion", ["session_id"], name: "bills_votequestion_session_id", using: :btree

  create_table "committees_committee", force: :cascade do |t|
    t.text    "name_en",                  null: false
    t.text    "short_name_en",            null: false
    t.string  "slug",          limit: 50, null: false
    t.integer "parent_id"
    t.boolean "display",                  null: false
    t.text    "name_fr",                  null: false
    t.text    "short_name_fr",            null: false
  end

  add_index "committees_committee", ["display"], name: "committees_committee_display", using: :btree
  add_index "committees_committee", ["parent_id"], name: "committees_committee_parent_id", using: :btree
  add_index "committees_committee", ["slug"], name: "committees_committee_slug_key", unique: true, using: :btree

  create_table "committees_committeeactivity", force: :cascade do |t|
    t.integer "committee_id",                             null: false
    t.string  "name_en",      limit: 500,                 null: false
    t.string  "name_fr",      limit: 500,                 null: false
    t.boolean "study",                    default: false, null: false
  end

  add_index "committees_committeeactivity", ["committee_id"], name: "committees_committeeactivity_committee_id", using: :btree

  create_table "committees_committeeactivityinsession", force: :cascade do |t|
    t.integer "activity_id",           null: false
    t.string  "session_id",  limit: 4, null: false
    t.integer "source_id",             null: false
  end

  add_index "committees_committeeactivityinsession", ["activity_id", "session_id"], name: "committees_committeeactivityi_activity_id_7357f535d6955621_uniq", unique: true, using: :btree
  add_index "committees_committeeactivityinsession", ["activity_id"], name: "committees_committeeactivityinsession_activity_id", using: :btree
  add_index "committees_committeeactivityinsession", ["session_id"], name: "committees_committeeactivityinsession_session_id", using: :btree
  add_index "committees_committeeactivityinsession", ["session_id"], name: "committees_committeeactivityinsession_session_id_like", using: :btree
  add_index "committees_committeeactivityinsession", ["source_id"], name: "committees_committeeactivityinsession_source_id_key", unique: true, using: :btree

  create_table "committees_committeeinsession", force: :cascade do |t|
    t.string  "session_id",   limit: 4, null: false
    t.integer "committee_id",           null: false
    t.string  "acronym",      limit: 5, null: false
  end

  add_index "committees_committeeinsession", ["acronym", "session_id"], name: "committees_committeeinsession_acronym_4d7dee190bc1dac4_uniq", unique: true, using: :btree
  add_index "committees_committeeinsession", ["acronym"], name: "committees_committeeinsession_acronym", using: :btree
  add_index "committees_committeeinsession", ["acronym"], name: "committees_committeeinsession_acronym_like", using: :btree
  add_index "committees_committeeinsession", ["committee_id"], name: "committees_committeeinsession_committee_id", using: :btree
  add_index "committees_committeeinsession", ["session_id", "committee_id"], name: "committees_committeeinsession_session_id_7ce4b4057e46edfd_uniq", unique: true, using: :btree
  add_index "committees_committeeinsession", ["session_id"], name: "committees_committeeinsession_session_id", using: :btree
  add_index "committees_committeeinsession", ["session_id"], name: "committees_committeeinsession_session_id_like", using: :btree

  create_table "committees_committeemeeting", force: :cascade do |t|
    t.date    "date",                                   null: false
    t.time    "start_time",                             null: false
    t.time    "end_time"
    t.integer "committee_id",                           null: false
    t.integer "number",       limit: 2,                 null: false
    t.string  "session_id",   limit: 4,                 null: false
    t.integer "minutes"
    t.integer "notice"
    t.integer "evidence_id"
    t.boolean "in_camera",              default: false, null: false
    t.boolean "travel",                 default: false, null: false
    t.boolean "webcast",                default: false, null: false
    t.boolean "televised",              default: false, null: false
  end

  add_index "committees_committeemeeting", ["committee_id"], name: "committees_committeemeeting_committee_id", using: :btree
  add_index "committees_committeemeeting", ["date"], name: "committees_committeemeeting_date", using: :btree
  add_index "committees_committeemeeting", ["evidence_id"], name: "committees_committeemeeting_evidence_id_key", unique: true, using: :btree
  add_index "committees_committeemeeting", ["session_id", "number", "committee_id"], name: "committees_committeemeeting_session_id_792939e90cda4ac1_uniq", unique: true, using: :btree
  add_index "committees_committeemeeting", ["session_id"], name: "committees_committeemeeting_session_id", using: :btree
  add_index "committees_committeemeeting", ["session_id"], name: "committees_committeemeeting_session_id_like", using: :btree

  create_table "committees_committeemeeting_activities", force: :cascade do |t|
    t.integer "committeemeeting_id",  null: false
    t.integer "committeeactivity_id", null: false
  end

  add_index "committees_committeemeeting_activities", ["committeeactivity_id"], name: "committees_committeemeeting_activities_committeeactivity_id", using: :btree
  add_index "committees_committeemeeting_activities", ["committeemeeting_id", "committeeactivity_id"], name: "committees_committeem_committeemeeting_id_36a83bbd36111342_uniq", unique: true, using: :btree
  add_index "committees_committeemeeting_activities", ["committeemeeting_id"], name: "committees_committeemeeting_activities_committeemeeting_id", using: :btree

  create_table "committees_committeereport", force: :cascade do |t|
    t.integer "committee_id",                                    null: false
    t.string  "session_id",          limit: 4,                   null: false
    t.integer "number",              limit: 2
    t.string  "name_en",             limit: 500,                 null: false
    t.integer "source_id",                                       null: false
    t.date    "adopted_date"
    t.date    "presented_date"
    t.boolean "government_response",             default: false, null: false
    t.integer "parent_id"
    t.string  "name_fr",             limit: 500,                 null: false
  end

  add_index "committees_committeereport", ["committee_id"], name: "committees_committeereport_committee_id", using: :btree
  add_index "committees_committeereport", ["parent_id"], name: "committees_committeereport_parent_id", using: :btree
  add_index "committees_committeereport", ["session_id"], name: "committees_committeereport_session_id", using: :btree
  add_index "committees_committeereport", ["session_id"], name: "committees_committeereport_session_id_like", using: :btree
  add_index "committees_committeereport", ["source_id"], name: "committees_committeereport_source_id_key", unique: true, using: :btree

  create_table "contact_contactmessage", force: :cascade do |t|
    t.integer  "thread_id",                     null: false
    t.string   "from_name",         limit: 120, null: false
    t.string   "from_raw",          limit: 300, null: false
    t.text     "message_display",               null: false
    t.text     "message",                       null: false
    t.text     "message_raw",                   null: false
    t.string   "subject",           limit: 400, null: false
    t.datetime "time",                          null: false
    t.boolean  "sent",                          null: false
    t.boolean  "published"
    t.boolean  "from_politician",               null: false
    t.string   "survey",            limit: 1,   null: false
    t.integer  "surveys_remaining",             null: false
    t.date     "last_survey"
  end

  add_index "contact_contactmessage", ["thread_id"], name: "contact_contactmessage_thread_id", using: :btree

  create_table "contact_contactthread", force: :cascade do |t|
    t.string   "code_email",          limit: 20,                  null: false
    t.string   "code_web",            limit: 20,                  null: false
    t.integer  "politician_id",                                   null: false
    t.string   "from_email",          limit: 75,                  null: false
    t.datetime "created",                                         null: false
    t.datetime "confirmed"
    t.boolean  "share",                                           null: false
    t.string   "why",                 limit: 1,                   null: false
    t.string   "from_postcode",       limit: 7,                   null: false
    t.string   "from_street_address", limit: 300,                 null: false
    t.boolean  "published",                       default: false, null: false
    t.integer  "surveys_remaining",                               null: false
  end

  add_index "contact_contactthread", ["code_email"], name: "contact_contactthread_code_email_key", unique: true, using: :btree
  add_index "contact_contactthread", ["code_web"], name: "contact_contactthread_code_web_key", unique: true, using: :btree
  add_index "contact_contactthread", ["politician_id"], name: "contact_contactthread_politician_id", using: :btree

  create_table "core_electedmember", force: :cascade do |t|
    t.integer "politician_id", null: false
    t.integer "riding_id",     null: false
    t.integer "party_id",      null: false
    t.date    "end_date"
    t.date    "start_date",    null: false
  end

  add_index "core_electedmember", ["end_date"], name: "core_electedmember_end_date", using: :btree
  add_index "core_electedmember", ["party_id"], name: "core_electedmember_party_id", using: :btree
  add_index "core_electedmember", ["politician_id"], name: "core_electedmember_member_id", using: :btree
  add_index "core_electedmember", ["riding_id"], name: "core_electedmember_riding_id", using: :btree
  add_index "core_electedmember", ["start_date"], name: "core_electedmember_start_date", using: :btree

  create_table "core_electedmember_sessions", force: :cascade do |t|
    t.integer "electedmember_id",           null: false
    t.string  "session_id",       limit: 4, null: false
  end

  add_index "core_electedmember_sessions", ["electedmember_id", "session_id"], name: "core_electedmember_sessions_electedmember_id_6d9c051f_uniq", unique: true, using: :btree
  add_index "core_electedmember_sessions", ["electedmember_id"], name: "core_electedmember_sessions_electedmember_id", using: :btree
  add_index "core_electedmember_sessions", ["session_id"], name: "core_electedmember_sessions_session_id", using: :btree

  create_table "core_internalxref", force: :cascade do |t|
    t.string  "text_value", limit: 50, null: false
    t.integer "int_value"
    t.integer "target_id",             null: false
    t.string  "schema",     limit: 15, null: false
  end

  add_index "core_internalxref", ["int_value"], name: "core_internalxref_int_value", using: :btree
  add_index "core_internalxref", ["schema"], name: "core_internalxref_schema", using: :btree
  add_index "core_internalxref", ["target_id"], name: "core_internalxref_target_id", using: :btree
  add_index "core_internalxref", ["text_value"], name: "core_internalxref_text_value", using: :btree

  create_table "core_party", force: :cascade do |t|
    t.string "name",       limit: 100, null: false
    t.string "slug",       limit: 10,  null: false
    t.string "short_name", limit: 100, null: false
  end

  create_table "core_politician", force: :cascade do |t|
    t.string "name",        limit: 100, null: false
    t.string "name_given",  limit: 50,  null: false
    t.string "name_family", limit: 50,  null: false
    t.date   "dob"
    t.string "gender",      limit: 1,   null: false
    t.string "headshot",    limit: 100
    t.string "slug",        limit: 30,  null: false
  end

  add_index "core_politician", ["slug"], name: "core_politician_slug", using: :btree
  add_index "core_politician", ["slug"], name: "core_politician_slug_like", using: :btree

  create_table "core_politicianinfo", force: :cascade do |t|
    t.integer "politician_id",            null: false
    t.text    "value",                    null: false
    t.string  "schema",        limit: 40, null: false
  end

  add_index "core_politicianinfo", ["politician_id"], name: "core_politicianinfo_politician_id", using: :btree
  add_index "core_politicianinfo", ["schema"], name: "core_politicianinfo_schema", using: :btree
  add_index "core_politicianinfo", ["schema"], name: "core_politicianinfo_schema_like", using: :btree

  create_table "core_riding", force: :cascade do |t|
    t.string  "name",     limit: 60, null: false
    t.string  "province", limit: 2,  null: false
    t.string  "slug",     limit: 60, null: false
    t.integer "edid"
  end

  add_index "core_riding", ["edid"], name: "core_riding_edid", using: :btree
  add_index "core_riding", ["slug"], name: "core_riding_slug", using: :btree
  add_index "core_riding", ["slug"], name: "core_riding_slug_key", unique: true, using: :btree

  create_table "core_session", force: :cascade do |t|
    t.string  "name",          limit: 100, null: false
    t.date    "start",                     null: false
    t.date    "end"
    t.integer "parliamentnum"
    t.integer "sessnum"
  end

  create_table "core_sitenews", force: :cascade do |t|
    t.datetime "date",               default: '2010-04-10 09:50:11', null: false
    t.text     "text",                                               null: false
    t.boolean  "active",             default: true,                  null: false
    t.string   "title",  limit: 200,                                 null: false
  end

  create_table "django_admin_log", force: :cascade do |t|
    t.datetime "action_time",                 null: false
    t.integer  "user_id",                     null: false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     limit: 200, null: false
    t.integer  "action_flag",     limit: 2,   null: false
    t.text     "change_message",              null: false
  end

  add_index "django_admin_log", ["content_type_id"], name: "django_admin_log_content_type_id", using: :btree
  add_index "django_admin_log", ["user_id"], name: "django_admin_log_user_id", using: :btree

  create_table "django_content_type", force: :cascade do |t|
    t.string "name",      limit: 100, null: false
    t.string "app_label", limit: 100, null: false
    t.string "model",     limit: 100, null: false
  end

  add_index "django_content_type", ["app_label", "model"], name: "django_content_type_app_label_key", unique: true, using: :btree

  create_table "django_flatpage", force: :cascade do |t|
    t.string  "url",                   limit: 100, null: false
    t.string  "title",                 limit: 200, null: false
    t.text    "content",                           null: false
    t.boolean "enable_comments",                   null: false
    t.string  "template_name",         limit: 70,  null: false
    t.boolean "registration_required",             null: false
  end

  add_index "django_flatpage", ["url"], name: "django_flatpage_url", using: :btree
  add_index "django_flatpage", ["url"], name: "django_flatpage_url_like", using: :btree

  create_table "django_flatpage_sites", force: :cascade do |t|
    t.integer "flatpage_id", null: false
    t.integer "site_id",     null: false
  end

  add_index "django_flatpage_sites", ["flatpage_id", "site_id"], name: "django_flatpage_sites_flatpage_id_key", unique: true, using: :btree
  add_index "django_flatpage_sites", ["flatpage_id"], name: "django_flatpage_sites_flatpage_id", using: :btree
  add_index "django_flatpage_sites", ["site_id"], name: "django_flatpage_sites_site_id", using: :btree

  create_table "django_session", primary_key: "session_key", force: :cascade do |t|
    t.text     "session_data", null: false
    t.datetime "expire_date",  null: false
  end

  create_table "django_site", force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name",   limit: 50,  null: false
  end

  create_table "elections_candidacy", force: :cascade do |t|
    t.integer "candidate_id",                                     null: false
    t.integer "riding_id",                                        null: false
    t.integer "party_id",                                         null: false
    t.integer "election_id",                                      null: false
    t.string  "occupation",   limit: 100,                         null: false
    t.integer "votetotal"
    t.boolean "elected"
    t.decimal "votepercent",              precision: 5, scale: 2
  end

  add_index "elections_candidacy", ["candidate_id"], name: "elections_candidacy_candidate_id", using: :btree
  add_index "elections_candidacy", ["election_id"], name: "elections_candidacy_election_id", using: :btree
  add_index "elections_candidacy", ["party_id"], name: "elections_candidacy_party_id", using: :btree
  add_index "elections_candidacy", ["riding_id"], name: "elections_candidacy_riding_id", using: :btree

  create_table "elections_election", force: :cascade do |t|
    t.date    "date",       null: false
    t.boolean "byelection", null: false
  end

  create_table "financials_contribution", force: :cascade do |t|
    t.integer "contributor_id",                                  null: false
    t.decimal "amount",                  precision: 7, scale: 2, null: false
    t.decimal "amount_monetary",         precision: 7, scale: 2
    t.decimal "amount_nonmonetary",      precision: 7, scale: 2
    t.date    "date"
    t.integer "individual_recipient_id",                         null: false
  end

  add_index "financials_contribution", ["contributor_id"], name: "financials_contribution_contributor_id", using: :btree
  add_index "financials_contribution", ["individual_recipient_id"], name: "financials_contribution_individual_recipient_id", using: :btree

  create_table "financials_contributor", force: :cascade do |t|
    t.string "name",        limit: 100, null: false
    t.string "name_given",  limit: 50,  null: false
    t.string "name_family", limit: 50,  null: false
    t.string "city",        limit: 50,  null: false
    t.string "province",    limit: 2,   null: false
    t.string "postcode",    limit: 7,   null: false
  end

  create_table "hansards_document", force: :cascade do |t|
    t.date    "date"
    t.string  "number",             limit: 6,   null: false
    t.string  "session_id",         limit: 4,   null: false
    t.string  "most_frequent_word", limit: 20,  null: false
    t.string  "wordcloud",          limit: 100
    t.string  "document_type",      limit: 1,   null: false
    t.integer "source_id",                      null: false
    t.boolean "downloaded",                     null: false
    t.boolean "public",                         null: false
    t.boolean "multilingual",                   null: false
    t.boolean "skip_parsing",                   null: false
  end

  add_index "hansards_document", ["document_type"], name: "hansards_document_document_type", using: :btree
  add_index "hansards_document", ["document_type"], name: "hansards_document_document_type_like", using: :btree
  add_index "hansards_document", ["session_id"], name: "hansards_hansard_session_id", using: :btree
  add_index "hansards_document", ["source_id"], name: "hansards_document_source_id", using: :btree
  add_index "hansards_document", ["source_id"], name: "hansards_document_source_id_uniq", unique: true, using: :btree

  create_table "hansards_oldsequencemapping", force: :cascade do |t|
    t.integer "document_id",             null: false
    t.integer "sequence",                null: false
    t.string  "slug",        limit: 100, null: false
  end

  add_index "hansards_oldsequencemapping", ["document_id", "sequence"], name: "hansards_oldsequencemapping_document_id_5714c13ec7f9a6b3_uniq", unique: true, using: :btree
  add_index "hansards_oldsequencemapping", ["document_id"], name: "hansards_oldsequencemapping_document_id", using: :btree
  add_index "hansards_oldsequencemapping", ["slug"], name: "hansards_oldsequencemapping_slug", using: :btree
  add_index "hansards_oldsequencemapping", ["slug"], name: "hansards_oldsequencemapping_slug_like", using: :btree

  create_table "hansards_statement", force: :cascade do |t|
    t.integer  "document_id",                               null: false
    t.datetime "time",                                      null: false
    t.string   "h1_en",            limit: 300, default: "", null: false
    t.string   "h2_en",            limit: 300, default: "", null: false
    t.integer  "member_id"
    t.string   "who_en",           limit: 300,              null: false
    t.text     "content_en",                                null: false
    t.integer  "sequence",                                  null: false
    t.integer  "wordcount",                                 null: false
    t.integer  "politician_id"
    t.boolean  "procedural",                                null: false
    t.string   "h3_en",            limit: 300,              null: false
    t.integer  "who_hocid"
    t.text     "content_fr",                                null: false
    t.string   "statement_type",   limit: 35,               null: false
    t.string   "written_question", limit: 1,                null: false
    t.string   "source_id",        limit: 15,               null: false
    t.string   "who_context_en",   limit: 300,              null: false
    t.string   "slug",             limit: 100,              null: false
    t.string   "urlcache",         limit: 200,              null: false
    t.string   "h1_fr",            limit: 400,              null: false
    t.string   "h2_fr",            limit: 400,              null: false
    t.string   "h3_fr",            limit: 400,              null: false
    t.string   "who_fr",           limit: 500,              null: false
    t.string   "who_context_fr",   limit: 500,              null: false
  end

  add_index "hansards_statement", ["document_id", "slug"], name: "hansards_statement_document_id_77a67b806d7aef3_uniq", unique: true, using: :btree
  add_index "hansards_statement", ["document_id"], name: "hansards_statement_hansard_id", using: :btree
  add_index "hansards_statement", ["member_id"], name: "hansards_statement_member_id", using: :btree
  add_index "hansards_statement", ["politician_id", "time"], name: "hansards_statement_politician_ordered", using: :btree
  add_index "hansards_statement", ["politician_id"], name: "hansards_statement_politician_id", using: :btree
  add_index "hansards_statement", ["procedural"], name: "hansards_statement_speaker", using: :btree
  add_index "hansards_statement", ["sequence"], name: "hansards_statement_sequence", using: :btree
  add_index "hansards_statement", ["slug"], name: "hansards_statement_slug", using: :btree
  add_index "hansards_statement", ["slug"], name: "hansards_statement_slug_like", using: :btree
  add_index "hansards_statement", ["time"], name: "hansards_statement_time", using: :btree
  add_index "hansards_statement", ["who_hocid"], name: "hansards_statement_who_hocid", using: :btree

  create_table "hansards_statement_bills", force: :cascade do |t|
    t.integer "statement_id", null: false
    t.integer "bill_id",      null: false
  end

  add_index "hansards_statement_bills", ["bill_id"], name: "hansards_statement_bills_bill_id", using: :btree
  add_index "hansards_statement_bills", ["statement_id", "bill_id"], name: "hansards_statement_bills_statement_id_55ead5ec_uniq", unique: true, using: :btree
  add_index "hansards_statement_bills", ["statement_id"], name: "hansards_statement_bills_statement_id", using: :btree

  create_table "hansards_statement_mentioned_politicians", force: :cascade do |t|
    t.integer "statement_id",  null: false
    t.integer "politician_id", null: false
  end

  add_index "hansards_statement_mentioned_politicians", ["politician_id"], name: "hansards_statement_mentioned_politicians_politician_id", using: :btree
  add_index "hansards_statement_mentioned_politicians", ["statement_id", "politician_id"], name: "hansards_statement_mentioned_statement_id_144d57244608b1e4_uniq", unique: true, using: :btree
  add_index "hansards_statement_mentioned_politicians", ["statement_id"], name: "hansards_statement_mentioned_politicians_statement_id", using: :btree

  create_table "indexer_index", force: :cascade do |t|
    t.string  "app_label",   limit: 32,  null: false
    t.string  "module_name", limit: 32,  null: false
    t.string  "column",      limit: 32,  null: false
    t.string  "value",       limit: 128, null: false
    t.integer "object_id",               null: false
  end

  add_index "indexer_index", ["app_label", "module_name", "column", "value", "object_id"], name: "indexer_index_app_label_4f912a625e395e28_uniq", unique: true, using: :btree

  create_table "labs_haiku", force: :cascade do |t|
    t.string  "line1",           limit: 50,  null: false
    t.string  "line2",           limit: 70,  null: false
    t.string  "line3",           limit: 50,  null: false
    t.string  "attribution",     limit: 300, null: false
    t.string  "attribution_url", limit: 100, null: false
    t.boolean "worthy",                      null: false
  end

  add_index "labs_haiku", ["worthy"], name: "labs_haiku_worthy", using: :btree

  create_table "search_indexingtask", force: :cascade do |t|
    t.string   "action",          limit: 10,                                  null: false
    t.string   "identifier",      limit: 100,                                 null: false
    t.datetime "timestamp",                   default: '2012-05-28 16:39:36', null: false
    t.integer  "content_type_id"
    t.string   "object_id",       limit: 20,                                  null: false
  end

  add_index "search_indexingtask", ["content_type_id"], name: "search_indexingtask_content_type_id", using: :btree

  create_table "sentry_filtervalue", force: :cascade do |t|
    t.string "key",   limit: 32,  null: false
    t.string "value", limit: 200, null: false
  end

  add_index "sentry_filtervalue", ["key", "value"], name: "sentry_filtervalue_key_490960fe2e7ed19d_uniq", unique: true, using: :btree

  create_table "sentry_groupedmessage", force: :cascade do |t|
    t.string   "logger",     limit: 64,  default: "root",                null: false
    t.string   "class_name", limit: 128
    t.integer  "level",                  default: 40,                    null: false
    t.text     "message",                                                null: false
    t.text     "traceback"
    t.string   "view",       limit: 200
    t.string   "checksum",   limit: 32,                                  null: false
    t.integer  "status",                 default: 0,                     null: false
    t.integer  "times_seen",             default: 1,                     null: false
    t.datetime "last_seen",              default: '2010-12-28 04:01:48', null: false
    t.datetime "first_seen",             default: '2010-12-28 04:01:48', null: false
    t.text     "data"
  end

  add_index "sentry_groupedmessage", ["checksum"], name: "sentry_groupedmessage_checksum", using: :btree
  add_index "sentry_groupedmessage", ["checksum"], name: "sentry_groupedmessage_checksum_like", using: :btree
  add_index "sentry_groupedmessage", ["class_name"], name: "sentry_groupedmessage_class_name", using: :btree
  add_index "sentry_groupedmessage", ["class_name"], name: "sentry_groupedmessage_class_name_like", using: :btree
  add_index "sentry_groupedmessage", ["first_seen"], name: "sentry_groupedmessage_first_seen", using: :btree
  add_index "sentry_groupedmessage", ["last_seen"], name: "sentry_groupedmessage_last_seen", using: :btree
  add_index "sentry_groupedmessage", ["level"], name: "sentry_groupedmessage_level", using: :btree
  add_index "sentry_groupedmessage", ["logger", "view", "checksum"], name: "sentry_groupedmessage_logger_6620e83ff8553a25_uniq", unique: true, using: :btree
  add_index "sentry_groupedmessage", ["logger"], name: "sentry_groupedmessage_logger", using: :btree
  add_index "sentry_groupedmessage", ["logger"], name: "sentry_groupedmessage_logger_like", using: :btree
  add_index "sentry_groupedmessage", ["status"], name: "sentry_groupedmessage_status", using: :btree
  add_index "sentry_groupedmessage", ["view"], name: "sentry_groupedmessage_view", using: :btree
  add_index "sentry_groupedmessage", ["view"], name: "sentry_groupedmessage_view_like", using: :btree

  create_table "sentry_message", force: :cascade do |t|
    t.string   "logger",      limit: 64,  default: "root",                null: false
    t.string   "class_name",  limit: 128
    t.integer  "level",                   default: 40,                    null: false
    t.text     "message",                                                 null: false
    t.text     "traceback"
    t.string   "view",        limit: 200
    t.string   "url",         limit: 200
    t.string   "server_name", limit: 128,                                 null: false
    t.string   "checksum",    limit: 32,                                  null: false
    t.datetime "datetime",                default: '2010-12-28 04:01:48', null: false
    t.text     "data"
    t.integer  "group_id"
    t.string   "site",        limit: 128
  end

  add_index "sentry_message", ["checksum"], name: "sentry_message_checksum", using: :btree
  add_index "sentry_message", ["checksum"], name: "sentry_message_checksum_like", using: :btree
  add_index "sentry_message", ["class_name"], name: "sentry_message_class_name", using: :btree
  add_index "sentry_message", ["class_name"], name: "sentry_message_class_name_like", using: :btree
  add_index "sentry_message", ["datetime"], name: "sentry_message_datetime", using: :btree
  add_index "sentry_message", ["group_id"], name: "sentry_message_group_id", using: :btree
  add_index "sentry_message", ["level"], name: "sentry_message_level", using: :btree
  add_index "sentry_message", ["logger"], name: "sentry_message_logger", using: :btree
  add_index "sentry_message", ["logger"], name: "sentry_message_logger_like", using: :btree
  add_index "sentry_message", ["server_name"], name: "sentry_message_server_name", using: :btree
  add_index "sentry_message", ["server_name"], name: "sentry_message_server_name_like", using: :btree
  add_index "sentry_message", ["site"], name: "sentry_message_site", using: :btree
  add_index "sentry_message", ["site"], name: "sentry_message_site_like", using: :btree
  add_index "sentry_message", ["view"], name: "sentry_message_view", using: :btree
  add_index "sentry_message", ["view"], name: "sentry_message_view_like", using: :btree

  create_table "south_migrationhistory", force: :cascade do |t|
    t.string   "app_name",  limit: 255, null: false
    t.string   "migration", limit: 255, null: false
    t.datetime "applied",               null: false
  end

  create_table "text_analysis_textanalysis", force: :cascade do |t|
    t.string   "key",                   limit: 150,                                 null: false
    t.string   "lang",                  limit: 2,                                   null: false
    t.datetime "updated",                           default: '2014-04-29 03:49:22', null: false
    t.datetime "expires"
    t.text     "probability_data_json",                                             null: false
  end

  add_index "text_analysis_textanalysis", ["key", "lang"], name: "text_analysis_textanalysis_key_44aa2303457adec6_uniq", unique: true, using: :btree
  add_index "text_analysis_textanalysis", ["key"], name: "text_analysis_textanalysis_key", using: :btree
  add_index "text_analysis_textanalysis", ["key"], name: "text_analysis_textanalysis_key_like", using: :btree

  add_foreign_key "alerts_politicianalert", "core_politician", column: "politician_id", name: "politician_id_refs_id_5df936fd4cdc864a"
  add_foreign_key "alerts_seenitem", "alerts_topic", column: "topic_id", name: "topic_id_refs_id_be88d095f79f677"
  add_foreign_key "alerts_subscription", "accounts_user", column: "user_id", name: "user_id_refs_id_40bec02c5ba745e6"
  add_foreign_key "alerts_subscription", "alerts_topic", column: "topic_id", name: "topic_id_refs_id_321f683c8b4497f8"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "group_id_refs_id_3cea63fe"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissions_permission_id_fkey"
  add_foreign_key "auth_message", "auth_user", column: "user_id", name: "auth_message_user_id_fkey"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "content_type_id_refs_id_728de91f"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_fkey"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "user_id_refs_id_7ceef80f"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permissions_permission_id_fkey"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "user_id_refs_id_dfbab7d"
  add_foreign_key "bills_bill", "core_electedmember", column: "sponsor_member_id", name: "sponsor_member_id_refs_id_6f3f762b"
  add_foreign_key "bills_bill", "core_politician", column: "sponsor_politician_id", name: "sponsor_politician_id_refs_id_188d955c"
  add_foreign_key "bills_billevent", "bills_billinsession", column: "bis_id", name: "bis_id_refs_id_57a47901e00ed2e8"
  add_foreign_key "bills_billevent", "hansards_document", column: "debate_id", name: "debate_id_refs_id_7e753bd0705fbae9"
  add_foreign_key "bills_billevent_committee_meetings", "bills_billevent", column: "billevent_id", name: "billevent_id_refs_id_159f3caa65b4bc07"
  add_foreign_key "bills_billevent_committee_meetings", "committees_committeemeeting", column: "committeemeeting_id", name: "committeemeeting_id_refs_id_728905a0b280c21c"
  add_foreign_key "bills_billinsession", "bills_bill", column: "bill_id", name: "bill_id_refs_id_75c273ca"
  add_foreign_key "bills_billinsession", "core_electedmember", column: "sponsor_member_id", name: "sponsor_member_id_refs_id_35000055468a8331"
  add_foreign_key "bills_billinsession", "core_politician", column: "sponsor_politician_id", name: "sponsor_politician_id_refs_id_47c3712866e2f0e2"
end
