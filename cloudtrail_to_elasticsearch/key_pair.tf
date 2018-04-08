###
#
# Key Pair
#
resource "aws_key_pair" "bastion" {
  key_name   = "bastion-for-kibana"
  public_key = "${file("bastion.pub")}"
}
