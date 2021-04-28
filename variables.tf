variable "accounts" {
    type = list(object({
        name = string
        email = string 
    }))
}