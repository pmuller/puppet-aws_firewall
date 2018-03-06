# aws_firewall::firewall::metadata
#
# Create an OUTPUT firewall rule allowing access to AWS instance metadata.
#
# @example
#   aws_firewall::rule::metadata { '200 Allow access to EC2 instance metadata':
#     uid => 4242,
#   }
#
define aws_firewall::rule::metadata (
  Optional[Variant[Integer, String]] $uid = undef,
  Optional[Variant[Integer, String]] $gid = undef,
  Enum['accept', 'drop'] $action = 'accept',
) {
  firewall { $title:
    chain       => 'OUTPUT',
    uid         => $uid,
    gid         => $gid,
    destination => '169.254.169.254',
    dport       => 80,
    proto       => 'tcp',
    state       => 'NEW',
    action      => $action,
    provider    => 'iptables',
  }
}