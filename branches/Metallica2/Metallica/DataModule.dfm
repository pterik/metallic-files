object DM: TDM
  OldCreateOrder = False
  Height = 666
  Width = 767
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
    Left = 272
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
    Left = 336
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
    Left = 319
    Top = 176
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
    Left = 336
    Top = 128
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
    Left = 352
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
  object QICompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO company(cm_id, cm_name, cm_city, cm_comment, cm_iscl' +
        'osed)'
      'VALUES(:cm_id, :cm_name, :cm_city, :cm_comment, :cm_isclosed)')
    Left = 408
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cm_id'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'cm_name'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'cm_city'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'cm_comment'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'cm_isclosed'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE company'
      'SET CM_NAME=:CM_NAME, '
      '    CM_CITY=:CM_CITY,'
      '    CM_COMMENT=:CM_COMMENT '
      'WHERE CM_ID=:CM_ID')
    Left = 472
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CM_NAME'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CM_CITY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CM_COMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CM_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QMaxCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cm_id) as cntr from company')
    Left = 536
    Top = 24
  end
  object QSCompanyNames: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select cm_name, cm_id from company'
      'where (upper(cm_name) like :Param)')
    Left = 656
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'Param'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QCntrPhoneCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*) as cntr from phones_companies'
      'where pc_phid=:pc_phid and pc_company=:pc_company')
    Left = 592
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pc_phid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pc_company'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QIPhoneCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'insert into phones_companies(pc_phid, pc_uid, pc_company, pc_dat' +
        'eupdate)'
      'values(:pc_phid, :pc_uid, :pc_company, :pc_dateupdate)')
    Left = 416
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pc_phid'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'pc_uid'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'pc_company'
        ParamType = ptInput
        Value = 'A'
      end
      item
        DataType = ftDateTime
        Name = 'pc_dateupdate'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUPhoneCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones_companies'
      'set pc_uid=:pc_uid,'
      'pc_dateupdate=:pc_dateupdate'
      'where pc_phid=:pc_phid'
      'and pc_company=:pc_company'
      '')
    Left = 480
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pc_uid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'pc_dateupdate'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'pc_phid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'pc_company'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QFindComNT: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(cnt_id) as cntr'
      'from companynametypes'
      'where CNT_NAME=:CNT_NAME')
    Left = 472
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'CNT_NAME'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QCntrComNT: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cnt_id) as cntr'
      'from companynametypes')
    Left = 544
    Top = 392
    object QCntrComNTCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QSettings: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'SELECT ST_ID, ST_NAME, ST_VALUE, ST_COMMENT '
      'FROM SETTINGS'
      'where ST_NAME=:ST_NAME')
    Left = 608
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'ST_NAME'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHeaderDelete: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'DELETE FROM grid_show'
      'WHERE gs_treeid =:TREEID'
      'AND ((gs_field =:field) OR (:field =CAST('#39#39' AS VARCHAR(50))))')
    Left = 400
    Top = 472
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TREEID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUComNT: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update COMPANYNAMETYPES'
      'set CNT_CNTR=CNT_CNTR+:CNT_ADD'
      'where CNT_NAME= :CNT_NAME')
    Left = 400
    Top = 392
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNT_ADD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CNT_NAME'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDisplay: TUniQuery
    Connection = FormMain.ZC
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
    Left = 464
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qTreeChild: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select PT_ID, PT_VALUE, PT_ORDERBY, PT_PARENTID,'
      'PT_DATE, PT_ISCLOSED,'
      '(select count(*) from price_lines pl'
      'where pl.pl_headerid = :headerid'
      'and pl.pl_treeid =pt.pt_id) cntr'
      ' From PRICES_TREE PT'
      'where PT_ParentID=:ParentID'
      'and PT_isclosed=0'
      'order by PT_ORDERBY')
    Left = 536
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'headerid'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ParentID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qTreeParent: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select PT_ID, PT_VALUE, PT_ORDERBY,'
      'PT_DATE, PT_ISCLOSED From PRICES_TREE'
      'where PT_PARENTID IS NULL'
      'and PT_isclosed=0'
      'order by PT_ORDERBY')
    Left = 688
    Top = 400
  end
  object qFindParent: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'select pt.pt_id, pt.PT_VALUE  PT_VALUE,  pt.PT_PARENTID PARENTID' +
        ','
      'pr.PT_VALUE PARENTVALUE'
      'from PRICES_TREE pt'
      'left join PRICES_TREE pr on pr.pt_id = pt.pt_parentid'
      'where pt.PT_ID=:ID'
      'and pt.pt_isclosed=0'
      'and (pr.pt_isclosed=0 or pr.pt_isclosed is null)')
    Left = 616
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QMaxContact: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cn_id) as cntr from contacts')
    Left = 688
    Top = 344
    object QMaxContactCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QUContactByComp: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET  CN_ISCLOSED=1'
      'WHERE CN_COMPANY=:CN_COMPANY')
    Left = 480
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'CN_COMPANY'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUCompanyByID: TUniSQL
    Connection = FormMain.ZC
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
    Left = 544
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_OWNER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_MANAGER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_COMPANY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_CONTACTER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_COMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_JOBTYPE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_JOBCOMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_PERIODICITY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUContactsByOwner: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET  CN_ISCLOSED=1'
      'WHERE CN_OWNER=:CN_OWNER')
    Left = 408
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_OWNER'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUContactAuto: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update contacts'
      'set CN_LAST_JOB=:CN_LAST_JOB,'
      'CN_LAST_JOB_DATE=:CN_LAST_JOB_DATE,'
      'CN_NEXT_JOB_DATE=:CN_NEXT_JOB_DATE, '
      'CN_ISCLOSED=:CN_ISCLOSED'
      'where CN_ID=:CN_ID')
    Left = 608
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_LAST_JOB'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'CN_LAST_JOB_DATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'CN_ISCLOSED'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUContactByID: TUniSQL
    Connection = FormMain.ZC
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
    Left = 536
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_OWNER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_MANAGER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_COMPANY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_CONTACTER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_COMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_JOBTYPE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_JOBCOMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_PERIODICITY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QDelUsersForBoss: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'delete from USERSFORBOSS'
      'WHERE UB_VIEWERID=:UB_VIEWERID')
    Left = 400
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UB_VIEWERID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QDContact: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET CN_COMMENT_CLOSE=:CN_COMMENT_CLOSE,'
      '    CN_NEXT_JOB_DATE=NULL,'
      '    CN_CLOSED_BY_MANAGER=:CN_CLOSED_BY_MANAGER,'
      '    CN_ISCLOSED=1'
      'WHERE CN_ID=:CN_ID')
    Left = 472
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'CN_COMMENT_CLOSE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_CLOSED_BY_MANAGER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDelJobsForBoss: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'delete from JOBSFORBOSS'
      'WHERE JB_VIEWERID=:JB_VIEWERID')
    Left = 608
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'JB_VIEWERID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qDelContactsViews: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'delete from CONTACTVIEWS'
      'WHERE CN_VIEWER=:CN_VIEWER')
    Left = 680
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_VIEWER'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QShortcut: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select CS_SHABLONE from call_shablone'
      'where cs_shortcut=:cs_shortcut')
    Left = 704
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cs_shortcut'
        ParamType = ptInput
        Value = nil
      end>
    object QShortcutCS_SHABLONE: TStringField
      FieldName = 'CS_SHABLONE'
      Size = 100
    end
  end
  object qHeaderGlobInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW '
      '(GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, :SHOW,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 688
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'FIELD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'SHOW'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = 0
      end>
  end
  object qHeaderGlobDelete: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'DELETE FROM grid_show'
      'WHERE gs_treeid IS NULL'
      'AND ((gs_field =:field) OR (:field =CAST('#39#39' AS VARCHAR(50))))')
    Left = 624
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUSettings: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE SETTINGS'
      'SET ST_VALUE=:ST_VALUE'
      'WHERE ST_NAME=:ST_NAME')
    Left = 552
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'ST_VALUE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'ST_NAME'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUUserbyID: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE USERS'
      'SET U_ISCLOSED=1'
      'WHERE U_ID=:U_ID')
    Left = 488
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'U_ID'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QIComNT: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'insert into COMPANYNAMETYPES'
      '        (CNT_ID, CNT_NAME, CNT_CNTR)'
      'values (:CNT_ID, :CNT_NAME, :CNT_CNTR)')
    Left = 688
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CNT_ID'
        Value = 0
      end
      item
        DataType = ftString
        Name = 'CNT_NAME'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'CNT_CNTR'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QIContact: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO CONTACTS(CN_ID, CN_OWNER, CN_MANAGER, CN_COMPANY, CN' +
        '_CONTACTER,'
      
        '    CN_COMMENT, CN_JOBTYPE, CN_JOBCOMMENT, CN_PERIODICITY, CN_NE' +
        'XT_JOB_DATE)'
      
        'VALUES (:CN_ID, :CN_OWNER, :CN_MANAGER, :CN_COMPANY, :CN_CONTACT' +
        'ER,'
      
        '    :CN_COMMENT, :CN_JOBTYPE, :CN_JOBCOMMENT, :CN_PERIODICITY, :' +
        'CN_NEXT_JOB_DATE)')
    Left = 624
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_ID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CN_OWNER'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CN_MANAGER'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'CN_COMPANY'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'CN_CONTACTER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CN_COMMENT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CN_JOBTYPE'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'CN_JOBCOMMENT'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'CN_PERIODICITY'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'CN_NEXT_JOB_DATE'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHeaderInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (:TREEID, :FIELD, :HEADER, :SHOW,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 712
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TREEID'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'FIELD'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftSmallint
        Name = 'SHOW'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = 0
      end>
  end
  object QFindPhone: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*)  as cntr from phones'
      'where (ph_id=:ph_id) ')
    Left = 592
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object QDPhone: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones'
      'set ph_dateend=:ph_dateend,'
      'ph_closedby=:ph_closedby, '
      'ph_isclosed=1'
      'where ph_id=:ph_id')
    Left = 656
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ph_dateend'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ph_closedby'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUPhoneDT: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones'
      'set ph_datebegin=:ph_datebegin, '
      'ph_isclosed=0'
      'where ph_id=:ph_id')
    Left = 408
    Top = 200
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ph_datebegin'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QUPhoneDT_Com: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones'
      'set ph_datebegin=:ph_datebegin,'
      'ph_comment=:ph_comment,'
      'ph_isclosed=0'
      'where ph_id=:ph_id')
    Left = 416
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ph_datebegin'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'ph_comment'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QIPhone: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'insert into phones(ph_id, ph_comment, ph_datebegin)'
      'values(:ph_id, :ph_comment, :ph_datebegin)')
    Left = 536
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'ph_comment'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'ph_datebegin'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHdrGlobExists: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*) as cntr FROM grid_show'
      'WHERE (gs_treeid IS NULL)'
      'AND (gs_field =:field) ')
    Left = 320
    Top = 392
    ParamData = <
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHdrGlobInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, 1,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 312
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'FIELD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = nil
      end>
  end
  object UniSQL1: TUniSQL
    Connection = FormMain.ZC
    Left = 32
    Top = 504
  end
  object UniQuery1: TUniQuery
    Connection = FormMain.ZC
    Left = 24
    Top = 552
  end
  object UniQuery2: TUniQuery
    Connection = FormMain.ZC
    Left = 32
    Top = 560
  end
  object UniSQL2: TUniSQL
    Connection = FormMain.ZC
    Left = 40
    Top = 512
  end
  object UniQuery3: TUniQuery
    Connection = FormMain.ZC
    Left = 40
    Top = 568
  end
  object UniSQL3: TUniSQL
    Connection = FormMain.ZC
    Left = 48
    Top = 520
  end
  object UniQuery4: TUniQuery
    Connection = FormMain.ZC
    Left = 40
    Top = 564
  end
  object qHdrUpdate: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update GRID_SHOW'
      'set GS_HEADER =:HEADER,'
      'GS_SIZE =:SIZE,'
      'GS_SHOW =:SHOW,'
      'GS_DISPLAYFORMAT =:DISPLAYFORMAT,'
      'GS_ORDERBY=:ORDERBY'
      'where (gs_treeid =:TREEID)'
      'AND (gs_field =:field) ')
    Left = 496
    Top = 560
    ParamData = <
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'SHOW'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'TREEID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
  object UniQuery5: TUniQuery
    Connection = FormMain.ZC
    Left = 48
    Top = 564
  end
  object qHdrInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (:TREEID, :FIELD, :HEADER, :SHOW,  '
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 432
    Top = 560
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TREEID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'FIELD'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftSmallint
        Name = 'SHOW'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHdrExists: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*) as cntr FROM grid_show'
      'WHERE (gs_treeid = :TREEID)'
      'AND (gs_field =:field) ')
    Left = 344
    Top = 556
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TREEID'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHdrGlobUpdate: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update GRID_SHOW'
      'set GS_HEADER =:HEADER,'
      'GS_SIZE =:SIZE, '
      'GS_DISPLAYFORMAT =:DISPLAYFORMAT,'
      'GS_ORDERBY=:ORDERBY'
      'where (gs_treeid IS NULL)'
      'AND (gs_field =:field) ')
    Left = 232
    Top = 560
    ParamData = <
      item
        DataType = ftString
        Name = 'HEADER'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'SIZE'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'DISPLAYFORMAT'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'ORDERBY'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
  end
end
