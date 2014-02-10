Option Explicit
Dim oParam
Dim oMsg
Dim subject
Dim body

Set oParam = WScript.Arguments
subject = oParam(0)
body = oParam(1)

Set oMsg = CreateObject("CDO.Message")

' en: Sender mail address
' ja: ���M�����[���A�h���X
oMsg.From = "sender@example.com"
' en: Recipient mail address
' ja: ���M�惁�[���A�h���X
oMsg.To = "recipient@example.com"
oMsg.Subject = subject
oMsg.TextBody = body & vbCrLf

oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2

oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1

' en: SMTP server hostname
' ja: SMTP�T�[�o��
oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = _
    "smtp.example.com"  ' change here

' en: SMTP server port number
' ja: SMTP�T�[�o�|�[�g�ԍ�
oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = _
    587  'change here

' en: SMTP user name
' ja: SMTP���[�U��
oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/sendusername") = _
    "sender"  ' change here

' en: SMTP password
' ja: SMTP�p�X���[�h
oMsg.Configuration.Fields.Item _
  ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = _
    "password"  ' change here

oMsg.Configuration.Fields.Update
oMsg.Send
