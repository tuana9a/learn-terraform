resource "cloudflare_record" "dns_group_1" {
  for_each = aws_instance.instance_group_1
  # for_each = aws_eip.eip_group_1

  zone_id = var.cloudflare_zone_id
  name    = "vm-instance-${each.key}"
  value   = each.value.public_ip
  type    = "A"
  ttl     = 86400
  proxied = false
}