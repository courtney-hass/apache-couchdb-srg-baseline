# encoding: UTF-8

control 'V-32528' do
  title "The DBMS must fail to a secure state if system initialization fails,
shutdown fails, or aborts fail."
  desc  "Failure to a known state can address safety or security in accordance
with the mission/business needs of the organization.

    Failure to a known secure state helps prevent a loss of confidentiality,
integrity, or availability in the event of a failure of the information system
or a component of the system.

    Failure to a known safe state helps prevent systems from failing to a state
that may cause loss of data or unauthorized access to system resources. Systems
that fail suddenly and with no incorporated failure state planning may leave
the hosting system available but with a reduced security protection capability.
Preserving information system state data also facilitates system restart and
return to the operational mode of the organization with less disruption of
mission/business processes.

    Databases must fail to a known consistent state. Transactions must be
successfully completed or rolled back.

    In general, security mechanisms should be designed so that a failure will
follow the same execution path as disallowing the operation. For example,
application security methods, such as isAuthorized(), isAuthenticated(), and
validate(), should all return false if there is an exception during processing.
If security controls can throw exceptions, they must be very clear about
exactly what that condition means.

    Abort refers to stopping a program or function before it has finished
naturally. The term abort refers to both requested and unexpected terminations.
  "
  desc  'rationale', ''
  desc  'check', "
     Check CouchDB settings and vendor documentation to verify that CouchDB
properly handles transactions in the event of a system failure.

    CouchDB supports replication, which copies the last revision of a database
document

    When changes are made to the configuration at runtime, the very last file
in the configuration chain will be updated with the changes in .ini files

    If open transactions are not rolled back to a consistent state during
system failure, this is a finding.

    The consistent state must include a security configuration that is at least
as restrictive as before the system failure. If this is not guaranteed, this is
a finding
  "
  desc  'fix', "Configure DBMS settings so that, in the event of a system
failure, CouchDB will roll back open transactions to a consistent state, to
include a security configuration that is at least as restrictive as before the
system failure."
  impact 0.5
  tag severity: 'medium'
  tag gtitle: 'SRG-APP-000225-DB-000153'
  tag gid: 'V-32528'
  tag rid: 'SV-42865r3_rule'
  tag stig_id: 'SRG-APP-000225-DB-000153'
  tag fix_id: nil
  tag cci: "CCI-001190
The information system fails to an organization-defined known-state for
organization-defined types of failures.
NIST SP 800-53 :: SC-24
NIST SP 800-53A :: SC-24.1 (iv)
NIST SP 800-53 Revision 4 :: SC-24

"
  tag nist: 'SC-24'
end

