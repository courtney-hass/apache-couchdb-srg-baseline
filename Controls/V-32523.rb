# encoding: UTF-8

control "V-32523" do
  title "The DBMS must invalidate session identifiers upon user logout or other
session termination."
  desc  "Captured sessions can be reused in \"replay\" attacks. This
requirement limits the ability of adversaries to capture and continue to employ
previously valid session IDs.

    This requirement focuses on communications protection for the DBMS session
rather than for the network packet. The intent of this control is to establish
grounds for confidence at each end of a communications session in the ongoing
identity of the other party and in the validity of the information being
transmitted.

    Session IDs are tokens generated by DBMSs to uniquely identify a user's (or
process's) session. DBMSs will make access decisions and execute logic based on
the session ID.

    Unique session IDs help to reduce predictability of said identifiers.
Unique session IDs address man-in-the-middle attacks, including session
hijacking or insertion of false information into a session. If the attacker is
unable to identify or guess the session information related to pending
application traffic, they will have more difficulty in hijacking the session or
otherwise manipulating valid sessions.

    When a user logs out, or when any other session termination event occurs,
the DBMS must terminate the user session(s) to minimize the potential for
sessions to be hijacked.
  "
  desc  "check", "
    Review DBMS settings and vendor documentation to verify user sessions are
terminated, and session identifiers invalidated, upon user logout. If they are
not, this is a finding.

    Review system documentation and organization policy to identify other
events that should result in session terminations.
    # find . -name \"local.ini\"
    #grep \x93chttpd\x94 section
    #grep \x93couch_httpd_auth\x94
    Verify the timeout variable has a set time
    Ex:  timeout = 600
    #grep \"couchdb\" section
    #Verify \"os_process_timeout\" has a set time

    If other session termination events are defined, review DBMS settings to
verify occurrences of these events would cause session termination,
invalidating the session identifiers.

    If occurrences of defined session terminating events do not cause session
terminations, invalidating the session identifiers, this is a finding.
  "
  desc  "fix", "
    Configure DBMS settings to terminate sessions, invalidating their session
identifiers, upon user logout.

    Configure DBMS settings to terminate sessions, invalidating their session
identifiers, upon the occurrence of any organization- or policy-defined session
termination event.
    # Set timeout variable to be 600
    # Set os_process_timeout to be 5000
  "
  impact 0.5
  tag "severity": "medium"
  tag "gtitle": "SRG-APP-000220-DB-000149"
  tag "gid": "V-32523"
  tag "rid": "SV-42860r2_rule"
  tag "stig_id": "SRG-APP-000220-DB-000149"
  tag "fix_id": nil
  tag "cci": ["CCI-001185"]
  tag "nist": ["SC-23 (1)", "Rev_4"]
end

