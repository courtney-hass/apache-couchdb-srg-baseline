# encoding: UTF-8

control 'V-58095' do
  title "The DBMS must generate audit records when categories of information
(e.g., classification levels/security levels) are accessed."
  desc  "Changes in categories of information must be tracked. Without an audit
trail, unauthorized access to protected data could go undetected.

    For detailed information on categorizing information, refer to FIPS
Publication 199, Standards for Security Categorization of Federal Information
and Information Systems, and FIPS Publication 200, Minimum Security
Requirements for Federal Information and Information Systems.
  "
  desc  'rationale', ''
  desc  'check', "
    Review the CouchDB database documentation and deployed configuration to
verify that the database is configured to log audit records for  when
categories of information (e.g., classification levels/security levels) are
accessed.

    # find . -name \"default.ini\"
    # grep \"file =\" <path to default.ini>
    if line does not exist or is commented out, this is a finding.
    #grep \"level =\" <path to default.ini>
    if line does not exist or is not set to info, this is a finding.

    If it is not set to log when categories of information (e.g.,
classification levels/security levels) are accessed, this is a finding.
  "
  desc  'fix', "
    Configure CouchDB to generate audit records when categories of information
(e.g., classification levels/security levels) are accessed.

    # find . -name \"default.ini\"
    # set level = info
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000494-DB-000344'
  tag gid: 'V-58095'
  tag rid: 'SV-72525r1_rule'
  tag stig_id: 'SRG-APP-000494-DB-000344'
  tag fix_id: nil
  tag cci: "CCI-000172
The information system generates audit records for the events defined in AU-2 d
with the content defined in AU-3.
NIST SP 800-53 :: AU-12 c
NIST SP 800-53A :: AU-12.1 (iv)
NIST SP 800-53 Revision 4 :: AU-12 c

"
  tag nist: 'AU-12 c'
end

