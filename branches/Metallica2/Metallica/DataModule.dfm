object DM: TDM
  OldCreateOrder = False
  Height = 577
  Width = 482
  object QICompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'INSERT INTO company(cm_id, cm_name, cm_owner, cm_trust,  cm_city' +
        ', cm_comment, cm_isclosed, cm_hyperlink, cm_business)'
      
        'VALUES(:cm_id, :cm_name,:cm_owner, :cm_trust, :cm_city, :cm_comm' +
        'ent, :cm_isclosed, :cm_hyperlink, :cm_business)')
    Left = 40
    Top = 16
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
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'cm_owner'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'cm_trust'
        Value = nil
      end
      item
        DataType = ftString
        Name = 'cm_city'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'cm_comment'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftSmallint
        Name = 'cm_isclosed'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftString
        Name = 'cm_hyperlink'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'cm_business'
        ParamType = ptInput
        Value = ''
      end>
  end
  object QUCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'UPDATE company'
      'SET CM_NAME=:CM_NAME, '
      '    CM_CITY=:CM_CITY,'
      '    CM_TRUST=:CM_TRUST,'
      '    CM_COMMENT=:CM_COMMENT,'
      '    CM_HYPERLINK=:CM_HYPERLINK,'
      '    CM_BUSINESS=:CM_BUSINESS'
      'WHERE CM_ID=:CM_ID')
    Left = 104
    Top = 16
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
        DataType = ftInteger
        Name = 'CM_TRUST'
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
        DataType = ftString
        Name = 'CM_HYPERLINK'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftString
        Name = 'CM_BUSINESS'
        ParamType = ptInput
        Value = nil
      end
      item
        DataType = ftInteger
        Name = 'CM_ID'
        ParamType = ptInput
        Value = 0
      end>
  end
  object QMaxCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cm_id) as cntr from company')
    Left = 168
    Top = 16
    object QMaxCompanyCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QSCompanyNames: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select cm_name, cm_id from company'
      'where (upper(cm_name) like :Param)')
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'Param'
        ParamType = ptInput
        Value = nil
      end>
    object QSCompanyNamesCM_NAME: TStringField
      FieldName = 'CM_NAME'
      Size = 100
    end
    object QSCompanyNamesCM_ID: TIntegerField
      FieldName = 'CM_ID'
      Required = True
    end
  end
  object QCntrPhoneCompany: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select count(*) as cntr from phones_companies'
      'where pc_phid=:pc_phid and pc_company=:pc_company')
    Left = 224
    Top = 16
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
    object QCntrPhoneCompanyCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QIPhoneCompany: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      
        'insert into phones_companies(pc_phid, pc_uid, pc_company, pc_dat' +
        'eupdate)'
      'values(:pc_phid, :pc_uid, :pc_company, :pc_dateupdate)')
    Left = 48
    Top = 72
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
    Left = 112
    Top = 72
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
    Left = 104
    Top = 384
    ParamData = <
      item
        DataType = ftString
        Name = 'CNT_NAME'
        ParamType = ptInput
        Value = nil
      end>
    object QFindComNTCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QCntrComNT: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cnt_id) as cntr'
      'from companynametypes')
    Left = 176
    Top = 384
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
    Left = 240
    Top = 464
    ParamData = <
      item
        DataType = ftString
        Name = 'ST_NAME'
        ParamType = ptInput
        Value = nil
      end>
    object QSettingsST_ID: TIntegerField
      FieldName = 'ST_ID'
      Required = True
    end
    object QSettingsST_NAME: TStringField
      FieldName = 'ST_NAME'
      Size = 100
    end
    object QSettingsST_VALUE: TStringField
      FieldName = 'ST_VALUE'
      Size = 100
    end
    object QSettingsST_COMMENT: TStringField
      FieldName = 'ST_COMMENT'
      Size = 255
    end
  end
  object qHeaderDelete: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'DELETE FROM grid_show'
      'WHERE gs_treeid =:TREEID'
      'AND ((gs_field =:field) OR (:field =CAST('#39#39' AS VARCHAR(50))))')
    Left = 32
    Top = 464
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
    Left = 32
    Top = 384
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
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'treeid'
        ParamType = ptInput
        Value = nil
      end>
    object qDisplayGS_TREEID: TIntegerField
      FieldName = 'GS_TREEID'
    end
    object qDisplayGS_FIELD: TStringField
      FieldName = 'GS_FIELD'
      Size = 50
    end
    object qDisplayGS_HEADER: TStringField
      FieldName = 'GS_HEADER'
      Size = 50
    end
    object qDisplayGS_SHOW: TSmallintField
      FieldName = 'GS_SHOW'
      Required = True
    end
    object qDisplayGS_SIZE: TIntegerField
      FieldName = 'GS_SIZE'
      Required = True
    end
    object qDisplayGS_DISPLAYFORMAT: TStringField
      FieldName = 'GS_DISPLAYFORMAT'
    end
    object qDisplayGS_ORDERBY: TIntegerField
      FieldName = 'GS_ORDERBY'
    end
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
    Top = 456
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
    object qTreeChildPT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object qTreeChildPT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object qTreeChildPT_ORDERBY: TIntegerField
      FieldName = 'PT_ORDERBY'
      Required = True
    end
    object qTreeChildPT_PARENTID: TIntegerField
      FieldName = 'PT_PARENTID'
    end
    object qTreeChildPT_DATE: TDateField
      FieldName = 'PT_DATE'
    end
    object qTreeChildPT_ISCLOSED: TSmallintField
      FieldName = 'PT_ISCLOSED'
      Required = True
    end
    object qTreeChildCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
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
    Top = 392
    object qTreeParentPT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object qTreeParentPT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object qTreeParentPT_ORDERBY: TIntegerField
      FieldName = 'PT_ORDERBY'
      Required = True
    end
    object qTreeParentPT_DATE: TDateField
      FieldName = 'PT_DATE'
    end
    object qTreeParentPT_ISCLOSED: TSmallintField
      FieldName = 'PT_ISCLOSED'
      Required = True
    end
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
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Value = nil
      end>
    object qFindParentPT_ID: TIntegerField
      FieldName = 'PT_ID'
      Required = True
    end
    object qFindParentPT_VALUE: TStringField
      FieldName = 'PT_VALUE'
      Required = True
      Size = 100
    end
    object qFindParentPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object qFindParentPARENTVALUE: TStringField
      FieldName = 'PARENTVALUE'
      ReadOnly = True
      Size = 100
    end
  end
  object QMaxContact: TUniQuery
    Connection = FormMain.ZC
    SQL.Strings = (
      'select max(cn_id) as cntr from contacts')
    Left = 320
    Top = 336
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
    Left = 112
    Top = 264
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
      'update CONTACTS'
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
    Left = 40
    Top = 248
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
    Left = 240
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
    Left = 168
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
    Left = 32
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
    Left = 104
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
    Left = 240
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
    Left = 312
    Top = 256
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
    Left = 336
    Top = 72
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
    Left = 320
    Top = 184
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
    Left = 256
    Top = 184
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
    Left = 184
    Top = 184
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
    Left = 120
    Top = 184
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
    Left = 344
    Top = 128
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
    Left = 280
    Top = 128
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
    Left = 368
    Top = 16
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
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ph_id'
        ParamType = ptInput
        Value = 1
      end>
    object QFindPhoneCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object QDPhone: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update phones'
      'set ph_dateend=:ph_dateend,'
      'ph_closedby=:ph_closedby, '
      'ph_isclosed=1'
      'where ph_id=:ph_id')
    Left = 288
    Top = 72
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
    Left = 40
    Top = 192
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
    Left = 48
    Top = 136
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
    Left = 168
    Top = 72
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
    Left = 400
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'field'
        ParamType = ptInput
        Value = nil
      end>
    object qHdrGlobExistsCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
  end
  object qHdrGlobInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (NULL, :FIELD, :HEADER, 1,'
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 112
    Top = 128
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
    Left = 224
    Top = 128
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
  object qHdrInsert: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'INSERT INTO GRID_SHOW (GS_TREEID, GS_FIELD, GS_HEADER, GS_SHOW,'
      'GS_SIZE, GS_DISPLAYFORMAT, GS_ORDERBY)'
      'VALUES (:TREEID, :FIELD, :HEADER, :SHOW,  '
      ':SIZE, :DISPLAYFORMAT, :ORDERBY)')
    Left = 168
    Top = 120
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
    Left = 416
    Top = 292
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
    object qHdrExistsCNTR: TIntegerField
      FieldName = 'CNTR'
      ReadOnly = True
    end
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
    Left = 312
    Top = 464
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
  object UniSQLMonitor1: TUniSQLMonitor
    Left = 400
    Top = 400
  end
  object qDelCompanyByID: TUniSQL
    Connection = FormMain.ZC
    SQL.Strings = (
      'update COMPANY'
      'set CM_ISCLOSED=1'
      'where CM_ID=:CM_ID')
    Left = 32
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CM_ID'
        ParamType = ptInput
        Value = 0
      end>
  end
end