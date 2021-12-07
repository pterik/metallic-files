object DM: TDM
  OldCreateOrder = False
  Height = 541
  Width = 620
  object QIPhone2: TZQuery
    SQL.Strings = (
      'insert into phones(ph_id, ph_comment, ph_datebegin)'
      'values(:ph_id, :ph_comment, :ph_datebegin)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'insert into phones(PH_ID, PH_STR, PH_COMMENT, PH_DATEBEGIN)'
      'values(:PH_ID, :PH_STR, :PH_COMMENT, :PH_DATEBEGIN);')
    Options = []
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end>
  end
  object QFindPhone2: TZQuery
    SQL.Strings = (
      'select count(*)  as cntr from phones'
      'where (ph_id=:ph_id) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 256
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
  end
  object QUPhoneDT_Com2: TZQuery
    SQL.Strings = (
      'update phones'
      'set ph_datebegin=:ph_datebegin,'
      'ph_comment=:ph_comment,'
      'ph_isclosed=0'
      'where ph_id=:ph_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'update PHONES'
      'set ph_datebegin=:ph_datebegin'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
  end
  object QMaxCompany2: TZQuery
    SQL.Strings = (
      'select max(cm_id) as cntr from company')
    Params = <>
    Options = []
    Left = 120
    Top = 112
  end
  object QICompany2: TZQuery
    SQL.Strings = (
      'INSERT INTO company(cm_id, cm_name, cm_owner, '
      
        'cm_city, cm_trust, cm_comment, cm_isclosed, CM_HYPERLINK, CM_BUS' +
        'INESS)'
      'VALUES(:cm_id, :cm_name, :cm_owner, :cm_city, '
      
        ':cm_trust, :cm_comment, :cm_isclosed, :CM_HYPERLINK, :CM_BUSINES' +
        'S)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_owner'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_city'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_trust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_isclosed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_HYPERLINK'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_BUSINESS'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      
        'insert into company(cm_id, cm_name, cm_manager, cm_comment, cm_i' +
        'sclosed)'
      'values(:cm_id, :cm_name, :cm_manager, :cm_comment, :cm_isclosed)')
    Options = []
    Left = 32
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_owner'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_city'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_trust'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_isclosed'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_HYPERLINK'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_BUSINESS'
        ParamType = ptUnknown
      end>
  end
  object QSCompanyNames2: TZQuery
    SQL.Strings = (
      'select cm_name, cm_id from company'
      'where (upper(cm_name) like :Param)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'Param'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 32
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Param'
        ParamType = ptUnknown
      end>
  end
  object QIPhoneCompany2: TZQuery
    SQL.Strings = (
      
        'insert into phones_companies(pc_phid, pc_uid, pc_company, pc_dat' +
        'eupdate)'
      'values(:pc_phid, :pc_uid, :pc_company, :pc_dateupdate)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_uid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_dateupdate'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      
        'insert into company(cm_id, cm_name, cm_manager, cm_comment, cm_i' +
        'sclosed)'
      'values(:cm_id, :cm_name, :cm_manager, :cm_comment, :cm_isclosed)')
    Options = []
    Left = 32
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_uid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_dateupdate'
        ParamType = ptUnknown
      end>
  end
  object QCntrPhoneCompany2: TZQuery
    SQL.Strings = (
      'select count(*) as cntr from phones_companies'
      'where pc_phid=:pc_phid and pc_company=:pc_company')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 224
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end>
  end
  object QUsersOrdered2: TZQuery
    SQL.Strings = (
      
        'select 0 orderby, U_ID, U_LOGIN||'#39' : '#39'||U_FIO USER_NAME  from us' +
        'ers u'
      'where ((U.U_ISCLOSED=:U_ISCLOSED) or (:U_ISCLOSED=-1))'
      'and (U_ID=:CUR_USER)'
      'union all'
      
        'select U_ID orderby, U_ID, U_LOGIN||'#39' : '#39'||U_FIO USER_NAME  from' +
        ' users u'
      'where ((U.U_ISCLOSED=:U_ISCLOSED) or (:U_ISCLOSED=-1))'
      'and (U_ID<>:CUR_USER)'
      'order by 1')
    Params = <
      item
        DataType = ftUnknown
        Name = 'U_ISCLOSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUR_USER'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 32
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'U_ISCLOSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CUR_USER'
        ParamType = ptUnknown
      end>
    object QUsersOrdered2USER_NAME: TStringField
      FieldName = 'USER_NAME'
      ReadOnly = True
      Size = 83
    end
    object QUsersOrdered2ORDERBY: TIntegerField
      FieldName = 'ORDERBY'
      ReadOnly = True
      Required = True
    end
    object QUsersOrdered2U_ID: TIntegerField
      FieldName = 'U_ID'
      Required = True
    end
  end
  object QUContactsByOwner2: TZQuery
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET  CN_ISCLOSED=1'
      'WHERE CN_OWNER=:CN_OWNER')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 112
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end>
  end
  object QUUserbyID2: TZQuery
    SQL.Strings = (
      'UPDATE USERS'
      'SET U_ISCLOSED=1'
      'WHERE U_ID=:U_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'U_ID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 256
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'U_ID'
        ParamType = ptUnknown
      end>
  end
  object QUCompanyByID2: TZQuery
    SQL.Strings = (
      'UPDATE COMPANY'
      'SET CM_ISCLOSED=1'
      'WHERE CM_ID=:CM_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CM_ID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 320
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CM_ID'
        ParamType = ptUnknown
      end>
  end
  object QUContactByComp2: TZQuery
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET  CN_ISCLOSED=1'
      'WHERE CN_COMPANY=:CN_COMPANY')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 32
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end>
  end
  object QUCompany2: TZQuery
    SQL.Strings = (
      'UPDATE company'
      'SET CM_NAME=:CM_NAME, '
      '    CM_CITY=:CM_CITY,'
      '    CM_TRUST=:CM_TRUST,'
      '    CM_COMMENT=:CM_COMMENT,'
      '    CM_HYPERLINK = :CM_HYPERLINK,'
      '   CM_BUSINESS = :CM_BUSINESS'
      'WHERE CM_ID=:CM_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cm_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_CITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_TRUST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_HYPERLINK'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_BUSINESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      
        'insert into company(cm_id, cm_name, cm_manager, cm_comment, cm_i' +
        'sclosed)'
      'values(:cm_id, :cm_name, :cm_manager, :cm_comment, :cm_isclosed)')
    Options = []
    Left = 120
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cm_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_CITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_TRUST'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_HYPERLINK'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CM_BUSINESS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cm_id'
        ParamType = ptUnknown
      end>
  end
  object QDelJobsForBoss2: TZQuery
    SQL.Strings = (
      'delete from JOBSFORBOSS'
      'WHERE JB_VIEWERID=:JB_VIEWERID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'JB_VIEWERID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 112
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'JB_VIEWERID'
        ParamType = ptUnknown
      end>
  end
  object QDelContactsViews2: TZQuery
    SQL.Strings = (
      'delete from CONTACTVIEWS'
      'WHERE CN_VIEWER=:CN_VIEWER')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_VIEWER'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 200
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_VIEWER'
        ParamType = ptUnknown
      end>
  end
  object QDelUsersForBoss2: TZQuery
    SQL.Strings = (
      'delete from USERSFORBOSS'
      'WHERE UB_VIEWERID=:UB_VIEWERID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'UB_VIEWERID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 296
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UB_VIEWERID'
        ParamType = ptUnknown
      end>
  end
  object QIContact2: TZQuery
    SQL.Strings = (
      
        'INSERT INTO CONTACTS(CN_ID, CN_OWNER, CN_MANAGER, CN_COMPANY, CN' +
        '_CONTACTER,'
      
        '    CN_COMMENT, CN_JOBTYPE, CN_JOBCOMMENT, CN_PERIODICITY, CN_NE' +
        'XT_JOB_DATE)'
      
        'VALUES (:CN_ID, :CN_OWNER, :CN_MANAGER, :CN_COMPANY, :CN_CONTACT' +
        'ER,'
      
        '    :CN_COMMENT, :CN_JOBTYPE, :CN_JOBCOMMENT, :CN_PERIODICITY, :' +
        'CN_NEXT_JOB_DATE)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CONTACTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBCOMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_PERIODICITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 32
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CONTACTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBCOMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_PERIODICITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end>
  end
  object QMaxContact2: TZQuery
    SQL.Strings = (
      'select max(cn_id) as cntr from contacts')
    Params = <>
    Options = []
    Left = 104
    Top = 384
  end
  object QDContact2: TZQuery
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET CN_COMMENT_CLOSE=:CN_COMMENT_CLOSE,'
      '    CN_NEXT_JOB_DATE=NULL,'
      '    CN_CLOSED_BY_MANAGER=:CN_CLOSED_BY_MANAGER,'
      '    CN_ISCLOSED=1'
      'WHERE CN_ID=:CN_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT_CLOSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CLOSED_BY_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 248
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT_CLOSE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CLOSED_BY_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
  end
  object QDPhone2: TZQuery
    SQL.Strings = (
      'update phones'
      'set ph_dateend=:ph_dateend,'
      'ph_closedby=:ph_closedby, '
      'ph_isclosed=1'
      'where ph_id=:ph_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ph_dateend'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_closedby'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'update PHONES'
      'set ph_datebegin=:ph_datebegin'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 336
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ph_dateend'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_closedby'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
  end
  object QIComNT2: TZQuery
    SQL.Strings = (
      'insert into COMPANYNAMETYPES'
      '        (CNT_ID, CNT_NAME, CNT_CNTR)'
      'values (:CNT_ID, :CNT_NAME, :CNT_CNTR)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CNT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_CNTR'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 32
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CNT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_CNTR'
        ParamType = ptUnknown
      end>
  end
  object QCntrComNT2: TZQuery
    SQL.Strings = (
      'select max(cnt_id) as cntr'
      'from companynametypes')
    Params = <>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 168
    Top = 440
    object QCntrComNT2CNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QFindComNT2: TZQuery
    SQL.Strings = (
      'select count(cnt_id) as cntr'
      'from companynametypes'
      'where CNT_NAME=:CNT_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 240
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QUComNT2: TZQuery
    SQL.Strings = (
      'update COMPANYNAMETYPES'
      'set CNT_CNTR=CNT_CNTR+:CNT_ADD'
      'where CNT_NAME= :CNT_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CNT_ADD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'select count(*)  as CNTR from phones'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 88
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CNT_ADD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CNT_NAME'
        ParamType = ptUnknown
      end>
    object IntegerField2: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QUContactByID2: TZQuery
    SQL.Strings = (
      'update  CONTACTS'
      'set'
      'CN_OWNER=:CN_OWNER,'
      'CN_MANAGER=:CN_MANAGER,'
      'CN_COMPANY=:CN_COMPANY,'
      'CN_CONTACTER=:CN_CONTACTER,'
      'CN_COMMENT=:CN_COMMENT,'
      'CN_JOBTYPE=:CN_JOBTYPE,'
      'CN_JOBCOMMENT=:CN_JOBCOMMENT,'
      'CN_PERIODICITY=:CN_PERIODICITY,'
      'CN_NEXT_JOB_DATE=:CN_NEXT_JOB_DATE'
      'where CN_ID=:CN_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CONTACTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBCOMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_PERIODICITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 176
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_OWNER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_MANAGER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMPANY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_CONTACTER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_COMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_JOBCOMMENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_PERIODICITY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
  end
  object QUContactAuto2: TZQuery
    SQL.Strings = (
      'update contacts'
      'set CN_LAST_JOB=:CN_LAST_JOB,'
      'CN_LAST_JOB_DATE=:CN_LAST_JOB_DATE,'
      'CN_NEXT_JOB_DATE=:CN_NEXT_JOB_DATE, '
      'CN_ISCLOSED=:CN_ISCLOSED'
      'where CN_ID=:CN_ID')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CN_LAST_JOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_LAST_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ISCLOSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
    Options = []
    Left = 184
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CN_LAST_JOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_LAST_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ISCLOSED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CN_ID'
        ParamType = ptUnknown
      end>
  end
  object QShortcut2: TZQuery
    SQL.Strings = (
      'select CS_SHABLONE from call_shablone'
      'where cs_shortcut=:cs_shortcut')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cs_shortcut'
        ParamType = ptUnknown
      end>
    Left = 208
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cs_shortcut'
        ParamType = ptUnknown
      end>
  end
  object QSettings2: TZQuery
    SQL.Strings = (
      'SELECT ST_ID, ST_NAME, ST_VALUE, ST_COMMENT '
      'FROM SETTINGS'
      'where ST_NAME=:ST_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ST_NAME'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'insert into phones(PH_ID, PH_STR, PH_COMMENT, PH_DATEBEGIN)'
      'values(:PH_ID, :PH_STR, :PH_COMMENT, :PH_DATEBEGIN);')
    Options = []
    Left = 208
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ST_NAME'
        ParamType = ptUnknown
      end>
  end
  object QUSettings2: TZQuery
    SQL.Strings = (
      'UPDATE SETTINGS'
      'SET ST_VALUE=:ST_VALUE'
      'WHERE ST_NAME=:ST_NAME')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ST_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ST_NAME'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'insert into phones(PH_ID, PH_STR, PH_COMMENT, PH_DATEBEGIN)'
      'values(:PH_ID, :PH_STR, :PH_COMMENT, :PH_DATEBEGIN);')
    Options = []
    Left = 288
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ST_VALUE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ST_NAME'
        ParamType = ptUnknown
      end>
  end
  object QUPhoneDT2: TZQuery
    SQL.Strings = (
      'update phones'
      'set ph_datebegin=:ph_datebegin, '
      'ph_isclosed=0'
      'where ph_id=:ph_id')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      'update PHONES'
      'set ph_datebegin=:ph_datebegin'
      'where (ph_id=:ph_id) or (ph_str=:ph_str)')
    Options = []
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ph_datebegin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ph_id'
        ParamType = ptUnknown
      end>
  end
  object QUPhoneCompany2: TZQuery
    SQL.Strings = (
      'update phones_companies'
      'set pc_uid=:pc_uid,'
      'pc_dateupdate=:pc_dateupdate'
      'where pc_phid=:pc_phid'
      'and pc_company=:pc_company'
      '')
    Params = <
      item
        DataType = ftUnknown
        Name = 'pc_uid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_dateupdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end>
    Properties.Strings = (
      
        'insert into company(cm_id, cm_name, cm_manager, cm_comment, cm_i' +
        'sclosed)'
      'values(:cm_id, :cm_name, :cm_manager, :cm_comment, :cm_isclosed)')
    Options = []
    Left = 120
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pc_uid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_dateupdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_phid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pc_company'
        ParamType = ptUnknown
      end>
  end
  object qFindParent2: TZReadOnlyQuery
    SQL.Strings = (
      
        'select pt.pt_id, pt.PT_VALUE  PT_VALUE,  pt.PT_PARENTID PARENTID' +
        ','
      'pr.PT_VALUE PARENTVALUE'
      'from PRICES_TREE pt'
      'left join PRICES_TREE pr on pr.pt_id = pt.pt_parentid'
      'where pt.PT_ID=:ID'
      'and pt.pt_isclosed=0'
      'and (pr.pt_isclosed=0 or pr.pt_isclosed is null)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qFindParent2PT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object qFindParent2PARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object qFindParent2PARENTVALUE: TStringField
      FieldName = 'PARENTVALUE'
      Required = True
      Size = 100
    end
    object qFindParent2PT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
  end
  object qTreeParent2: TZReadOnlyQuery
    SQL.Strings = (
      'select PT_ID, PT_VALUE, PT_ORDERBY,'
      'PT_DATE, PT_ISCLOSED From PRICES_TREE'
      'where PT_PARENTID IS NULL'
      'and PT_isclosed=0'
      'order by PT_ORDERBY')
    Params = <>
    Left = 24
    Top = 224
    object qTreeParent2PT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object qTreeParent2PT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object qTreeParent2PT_DATE: TDateField
      FieldName = 'PT_DATE'
    end
    object qTreeParent2PT_ISCLOSED: TSmallintField
      FieldName = 'PT_ISCLOSED'
      Required = True
    end
    object qTreeParent2PT_ORDERBY: TIntegerField
      FieldName = 'PT_ORDERBY'
    end
  end
  object qTreeChild2: TZReadOnlyQuery
    SQL.Strings = (
      'select PT_ID, PT_VALUE, PT_ORDERBY, PT_PARENTID,'
      'PT_DATE, PT_ISCLOSED,'
      '(select count(*) from price_lines pl'
      'where pl.pl_headerid = :headerid'
      'and pl.pl_treeid =pt.pt_id'
      'and pl_isclosed =0) cntr'
      ' From PRICES_TREE PT'
      'where PT_ParentID=:ParentID'
      'and PT_isclosed=0'
      'order by PT_ORDERBY')
    Params = <
      item
        DataType = ftUnknown
        Name = 'headerid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ParentID'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'headerid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ParentID'
        ParamType = ptUnknown
      end>
    object IntegerField9: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object DateField3: TDateField
      FieldName = 'PT_DATE'
    end
    object SmallintField1: TSmallintField
      FieldName = 'PT_ISCLOSED'
      Required = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'PT_ORDERBY'
    end
    object qTreeChild2CNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
    object qTreeChild2PT_PARENTID: TIntegerField
      FieldName = 'PT_PARENTID'
    end
  end
  object qHdrGlobExists2: TZQuery
    SQL.Strings = (
      'select count(*) as cntr FROM grid_show'
      'WHERE (gs_treeid IS NULL)'
      'AND (gs_field =:field) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'field'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 360
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'field'
        ParamType = ptUnknown
      end>
    object qHdrGlobExists2CNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object qHdrGlobInsert2: TZQuery
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, 1,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 448
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
  end
  object qHdrExists2: TZQuery
    SQL.Strings = (
      'select count(*) as cntr FROM grid_show'
      'WHERE (gs_treeid = :TREEID)'
      'AND (gs_field =:field) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'field'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 287
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'field'
        ParamType = ptUnknown
      end>
    object qHdrExists2CNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object qHdrInsert2: TZQuery
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (:TREEID, :FIELD, :HEADER, :SHOW,  '
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 359
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end>
  end
  object qDisplay2: TZReadOnlyQuery
    SortedFields = 'GS_ORDERBY'
    SQL.Strings = (
      'SELECT gs_treeid, gs_field, gs_header, gs_show,'
      'gs_size, gs_displayformat, gs_orderby FROM grid_show'
      'WHERE gs_treeid IS NULL'
      'AND gs_field NOT IN'
      '    (SELECT gs_field FROM grid_show'
      '    WHERE gs_treeid = :treeid)'
      'UNION ALL'
      'SELECT gs_treeid, gs_field, gs_header, gs_show,'
      'gs_size, gs_displayformat, gs_orderby FROM grid_show'
      'WHERE gs_treeid = :treeid')
    Params = <
      item
        DataType = ftUnknown
        Name = 'treeid'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'GS_ORDERBY Asc'
    Left = 128
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'treeid'
        ParamType = ptUnknown
      end>
    object qDisplay2GS_FIELD: TStringField
      FieldName = 'GS_FIELD'
      Size = 50
    end
    object qDisplay2GS_HEADER: TStringField
      FieldName = 'GS_HEADER'
      Size = 50
    end
    object qDisplay2GS_SHOW: TSmallintField
      FieldName = 'GS_SHOW'
      Required = True
    end
    object qDisplay2GS_SIZE: TIntegerField
      FieldName = 'GS_SIZE'
      Required = True
    end
    object qDisplay2GS_DISPLAYFORMAT: TStringField
      FieldName = 'GS_DISPLAYFORMAT'
    end
    object qDisplay2GS_TREEID: TIntegerField
      FieldName = 'GS_TREEID'
    end
    object qDisplay2GS_ORDERBY: TIntegerField
      FieldName = 'GS_ORDERBY'
      Required = True
    end
  end
  object qHdrGlobUpdate2: TZQuery
    SQL.Strings = (
      'update GRID_SHOW'
      'set GS_HEADER =:HEADER,'
      'GS_SIZE =:SIZE, '
      'GS_DISPLAYFORMAT =:DISPLAYFORMAT,'
      'GS_ORDERBY=:ORDERBY'
      'where (gs_treeid IS NULL)'
      'AND (gs_field =:field) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 528
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end>
  end
  object qHdrUpdate2: TZQuery
    SQL.Strings = (
      'update GRID_SHOW'
      'set GS_HEADER =:HEADER,'
      'GS_SIZE =:SIZE,'
      'GS_SHOW =:SHOW,'
      'GS_DISPLAYFORMAT =:DISPLAYFORMAT,'
      'GS_ORDERBY=:ORDERBY'
      'where (gs_treeid =:TREEID)'
      'AND (gs_field =:field) ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end>
    WhereMode = wmWhereAll
    Options = []
    Left = 424
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'HEADER'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SIZE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DISPLAYFORMAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORDERBY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TREEID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FIELD'
        ParamType = ptUnknown
      end>
  end
end
