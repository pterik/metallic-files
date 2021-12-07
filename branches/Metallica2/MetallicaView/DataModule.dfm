object DM: TDM
  OldCreateOrder = False
  Height = 541
  Width = 424
  object QFindComNT: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(cnt_id) as cntr'
      'from companynametypes'
      'where CNT_NAME=:CNT_NAME')
    Left = 104
    Top = 376
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
    Left = 176
    Top = 376
    object QCntrComNTCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QMaxContact: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cn_id) as cntr from contacts')
    Left = 320
    Top = 328
    object QMaxContactCNTR: TIntegerField
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
    Left = 240
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'ST_NAME'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QShortcut: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select CS_SHABLONE from call_shablone'
      'where cs_shortcut=:cs_shortcut')
    Left = 312
    Top = 136
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
  object QSCompanyNames: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select cm_name, cm_id from company'
      'where (upper(cm_name) like :Param)')
    Left = 240
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'Param'
        ParamType = ptInput
        Value = nil
      end>
  end
  object QMaxCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cm_id) as cntr from company')
    Left = 168
    Top = 72
  end
  object QCntrPhoneCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*) as cntr from phones_companies'
      'where pc_phid=:pc_phid and pc_company=:pc_company')
    Left = 312
    Top = 72
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
  object QFindPhone: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*)  as cntr from phones'
      'where (ph_id=:ph_id) ')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object qHeaderDelete: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'DELETE FROM grid_show'
      'WHERE gs_treeid =:TREEID'
      'AND ((gs_field =:field) OR (:field =CAST('#39#39' AS VARCHAR(50))))')
    Left = 32
    Top = 456
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
  object QUContactByComp: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE CONTACTS'
      'SET  CN_ISCLOSED=1'
      'WHERE CN_COMPANY=:CN_COMPANY')
    Left = 120
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'CN_COMPANY'
        ParamType = ptInput
        Value = nil
      end>
  end
  object qHeaderGlobInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW '
      '(GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, :SHOW,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 248
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
    Left = 184
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
    Left = 112
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
  object QDPhone: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones'
      'set ph_dateend=:ph_dateend,'
      'ph_closedby=:ph_closedby, '
      'ph_isclosed=1'
      'where ph_id=:ph_id')
    Left = 168
    Top = 16
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
    Left = 232
    Top = 16
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
    Left = 312
    Top = 16
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
    Left = 48
    Top = 16
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
  object QUUserbyID: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE USERS'
      'SET U_ISCLOSED=1'
      'WHERE U_ID=:U_ID')
    Left = 48
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
    Left = 248
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
    Left = 184
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
  object QUPhoneCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones_companies'
      'set pc_uid=:pc_uid,'
      'pc_dateupdate=:pc_dateupdate'
      'where pc_phid=:pc_phid'
      'and pc_company=:pc_company'
      '')
    Left = 112
    Top = 136
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
  object QIPhoneCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'insert into phones_companies(pc_phid, pc_uid, pc_company, pc_dat' +
        'eupdate)'
      'values(:pc_phid, :pc_uid, :pc_company, :pc_dateupdate)')
    Left = 48
    Top = 136
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
  object QUCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE company'
      'SET CM_NAME=:CM_NAME, '
      '    CM_CITY=:CM_CITY,'
      '    CM_COMMENT=:CM_COMMENT '
      'WHERE CM_ID=:CM_ID')
    Left = 112
    Top = 72
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
  object QICompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO company(cm_id, cm_name, cm_city, cm_comment, cm_iscl' +
        'osed)'
      'VALUES(:cm_id, :cm_name, :cm_city, :cm_comment, :cm_isclosed)')
    Left = 48
    Top = 72
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
    Left = 184
    Top = 256
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
    Left = 48
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_OWNER'
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
    Left = 312
    Top = 192
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
  object QUContactAuto: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update contacts'
      'set CN_LAST_JOB=:CN_LAST_JOB,'
      'CN_LAST_JOB_DATE=:CN_LAST_JOB_DATE,'
      'CN_NEXT_JOB_DATE=:CN_NEXT_JOB_DATE, '
      'CN_ISCLOSED=:CN_ISCLOSED'
      'where CN_ID=:CN_ID')
    Left = 248
    Top = 320
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
    Left = 176
    Top = 320
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
    Left = 40
    Top = 312
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
    Left = 112
    Top = 312
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
    Left = 248
    Top = 264
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
    Left = 320
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CN_VIEWER'
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
    Left = 32
    Top = 376
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
    Left = 96
    Top = 448
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
    Left = 168
    Top = 448
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
    Left = 320
    Top = 384
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
    Left = 248
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = nil
      end>
  end
end
