# encoding: UTF-8

control 'V-58051' do
  title "The DBMS must provide centralized configuration of the content to be
captured in audit records generated by all components of the DBMS."
  desc  "If the configuration of the DBMS's auditing is spread across multiple
locations in the database management software, or across multiple commands,
only loosely related, it is harder to use and takes longer to reconfigure in
response to events.

    The DBMS must provide a unified tool for audit configuration.
  "
  desc  'rationale', ''
  desc  'check', "
    Review the CouchDB database documentation and deployed configuration to
verify that the database is configured to log audit records for centralized
configuration of the content to be captured in audit records generated by all
components of the CouchDB database.

    # find . -name \"default.ini\"

    # grep \"file =\" <path to default.ini>
    if line does not exist or is commented out, this is a finding.
    #grep \"level =\" <path to default.ini>
    if line does not exist or is not set to info, this is a finding.

    If it is not set to log audit records for centralized configuration of the
content to be captured in audit records generated by all components of the
CouchDB database, this is a finding.
  "
  desc  'fix', "
    Configure CouchDB to provide centralized configuration of the content to be
captured in audit records generated by all components of CouchDB.

    # find . -name \"default.ini\"
    # set level = info
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000356-DB-000315'
  tag gid: 'V-58051'
  tag rid: 'SV-72481r1_rule'
  tag stig_id: 'SRG-APP-000356-DB-000315'
  tag fix_id: nil
  tag cci: "CCI-001844
The information system provides centralized management and configuration of the
content to be captured in audit records generated by organization-defined
information system components.
NIST SP 800-53 Revision 4 :: AU-3 (2)

"
  tag nist: 'AU-3 (2)'
end

