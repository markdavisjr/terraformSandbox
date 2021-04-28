
resource "aws_organizations_organization" "org" {
    aws_service_access_principals = [
        "cloudtrail.amazonaws.com",
    ]

    feature_set = "ALL"
}

resource "aws_organizations_account" "accounts" {

    count = length(var.accounts)
    name  = var.accounts[count.index].name
    email = var.accounts[count.index].email

    depends_on = [aws_organizations_organization.org]
}

resource "aws_iam_user" "new_user_test" {
    name = "admin"
}

resource "aws_iam_user_login_profile" "profile" {
    user    = aws_iam_user.new_user_test.name
    pgp_key = "keybase:darkmavisdev"
    
}