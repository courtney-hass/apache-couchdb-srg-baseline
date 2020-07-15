# encoding: UTF-8

control 'V-58135' do
  title "The DBMS must prohibit user installation of logic modules (stored
procedures, functions, triggers, views, etc.) without explicit privileged
status."
  desc  "Allowing regular users to install software, without explicit
privileges, creates the risk that untested or potentially malicious software
will be installed on the system. Explicit privileges (escalated or
administrative privileges) provide the regular user with explicit capabilities
and control that exceed the rights of a regular user.

    DBMS functionality and the nature and requirements of databases will vary;
so while users are not permitted to install unapproved software, there may be
instances where the organization allows the user to install approved software
packages such as from an approved software repository. The requirements for
production servers will be more restrictive than those used for development and
research.

    The DBMS must enforce software installation by users based upon what types
of software installations are permitted (e.g., updates and security patches to
existing software) and what types of installations are prohibited (e.g.,
software whose pedigree with regard to being potentially malicious is unknown
or suspect) by the organization).

    In the case of a database management system, this requirement covers stored
procedures, functions, triggers, views, etc.
  "
  desc  'rationale', ''
  desc  'check', "
    If CouchDB supports only software development, experimentation and/or
developer-level testing (that is, excluding production systems, integration
testing, stress testing, and user acceptance testing), this is not a finding.

    Review CouchDB and database security settings with respect to
non-administrative users' ability to create, alter, or replace logic modules,
to include but not necessarily only stored procedures, functions, triggers, and
views.

    To list the privileges for all tables and schemas, as the database
administrator, run the following:
     #GET /db/_security

    If the privileges are exceed what user and groups should have, this is a
finding.
  "
  desc  'fix', "
    Use the following command to set privileges correctly:

    # PUT /{db}/_security

    Example request:
    shell> curl http://localhost:5984/pineapple/_security -X PUT -H
'content-type: application/json' -H 'accept: application/json' -d
'{\"admins\":{\"names\":[\"superuser\"],\"roles\":[\"admins\"]},\"members\":{\"names\":
[\"user1\",\"user2\"],\"roles\": [\"developers\"]}}'
  "
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000378-DB-000365'
  tag gid: 'V-58135'
  tag rid: 'SV-72565r1_rule'
  tag stig_id: 'SRG-APP-000378-DB-000365'
  tag fix_id: nil
  tag cci: "CCI-001812
The information system prohibits user installation of software without explicit
privileged status.
NIST SP 800-53 Revision 4 :: CM-11 (2)

"
  tag nist: 'CM-11 (2)'
end

