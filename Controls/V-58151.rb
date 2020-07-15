# encoding: UTF-8

control 'V-58151' do
  title "Access to database files must be limited to relevant processes and to
authorized, administrative users."
  desc  "Applications, including DBMSs, must prevent unauthorized and
unintended information transfer via shared system resources. Permitting only
DBMS processes and authorized, administrative users to have access to the files
where the database resides helps ensure that those files are not shared
inappropriately and are not open to backdoor access and manipulation."
  desc  'rationale', ''
  desc  'check', "
    Review the permissions granted to users by the operating system/file system
on the database files, database log files and database backup files.
    Check for the following:

    Execute the command #GET /db/_security
    Verify the admins are authorized, administrative users. If not, this is a
finding.
    # find .-name \"default.ini\"
    # grep \"admin_only_all_dbs\" default.ini
    If this is commented out, or not set equal to true, this is a finding.
  "
  desc  'fix', "
    Configure the permissions granted by the operating system/file system on
the database files, database log files, and database backup files so that only
relevant system accounts and authorized system administrators and database
administrators with a need to know are permitted to read/view these files.
    # find .-name \"default.ini\"
    # grep \"admin_only_all_dbs\" default.ini
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000243-DB-000374'
  tag gid: 'V-58151'
  tag rid: 'SV-72581r1_rule'
  tag stig_id: 'SRG-APP-000243-DB-000374'
  tag fix_id: nil
  tag cci: "CCI-001090
The information system prevents unauthorized and unintended information
transfer via shared system resources.
NIST SP 800-53 :: SC-4
NIST SP 800-53A :: SC-4.1
NIST SP 800-53 Revision 4 :: SC-4

"
  tag nist: 'SC-4'
end

