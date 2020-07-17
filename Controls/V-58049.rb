# encoding: UTF-8

control "V-58049" do
  title "The DBMS must utilize centralized management of the content captured
in audit records generated by all components of the DBMS."
  desc  "Without the ability to centrally manage the content captured in the
audit records, identification, troubleshooting, and correlation of suspicious
behavior would be difficult and could lead to a delayed or incomplete analysis
of an ongoing attack.

    The content captured in audit records must be managed from a central
location (necessitating automation). Centralized management of audit records
and logs provides for efficiency in maintenance and management of records, as
well as the backup and archiving of those records.

    The DBMS may write audit records to database tables, to files in the file
system, to other kinds of local repository, or directly to a centralized log
management system. Whatever the method used, it must be compatible with
off-loading the records to the centralized system.
  "
  desc  "check", "
    Review the system documentation for a description of how audit records are
off-loaded and how local audit log space is managed.

    # find . -name \"default.ini\"
    # grep \"file =\" <path to default.ini>
    if line does not exist or is commented out, this is a finding.
    #grep \x93log\x94 section
    #grep \"sys_facilities =\" <path to default.ini>
    if line does not exist or is not set to info, this is a finding.
    If the CouchDB audit records are not written directly to or systematically
transferred to a centralized log management system, this is a finding.
  "
  desc  "fix", "Configure and/or deploy software tools to ensure that the
CouchDB audit records are written directly to or systematically transferred to
a centralized log management system. Configure loging to be enabled"
  impact 0.5
  tag "severity": "medium"
  tag "gtitle": "SRG-APP-000356-DB-000314"
  tag "gid": "V-58049"
  tag "rid": "SV-72479r1_rule"
  tag "stig_id": "SRG-APP-000356-DB-000314"
  tag "fix_id": nil
  tag "cci": ["CCI-001844"]
  tag "nist": ["AU-3 (2)", "Rev_4"]
end

