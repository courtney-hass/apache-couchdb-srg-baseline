# encoding: UTF-8

control "V-32442" do
  title "The DBMS must uniquely identify and authenticate organizational users
(or processes acting on behalf of organizational users)."
  desc  "To assure accountability and prevent unauthenticated access,
organizational users must be identified and authenticated to prevent potential
misuse and compromise of the system.

    Organizational users include organizational employees or individuals the
organization deems to have equivalent status of employees (e.g., contractors).
Organizational users (and any processes acting on behalf of users) must be
uniquely identified and authenticated for all accesses, except the following:

    (i) Accesses explicitly identified and documented by the organization.
Organizations document specific user actions that can be performed on the
information system without identification or authentication; and
    (ii) Accesses that occur through authorized use of group authenticators
without individual authentication. Organizations may require unique
identification of individuals using shared accounts, for detailed
accountability of individual activity.
  "
  desc  "check", "
    Review DBMS settings to determine whether organizational users are uniquely
identified and authenticated when logging on/connecting to the system.
    Check for the following:

    # find . -name \"local.ini\"
    #grep \x91roles\x92 for a list of user roles.
    If users are not uniquely identified as per organizational documentation,
this is a finding.
  "
  desc  "fix", "Configure DBMS settings to uniquely identify and authenticate
all organizational users who log on/connect to the system."
  impact 0.5
  tag "severity": "medium"
  tag "gtitle": "SRG-APP-000148-DB-000103"
  tag "gid": "V-32442"
  tag "rid": "SV-42779r4_rule"
  tag "stig_id": "SRG-APP-000148-DB-000103"
  tag "fix_id": nil
  tag "cci": ["CCI-000764"]
  tag "nist": ["IA-2", "Rev_4"]
end

