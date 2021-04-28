output "user_pass" {
  value = aws_iam_user_login_profile.profile.encrypted_password
}
