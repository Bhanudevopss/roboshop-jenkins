variable "folders" {
  default = ["Infra", "CI-Pipeline"]
}

variable "m-jobs" {
  default = [
    { name = "frontend", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/frontend" },
    { name = "catalogue", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/catalogue" },
    { name = "user", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/user" },
    { name = "cart", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/cart" },
    { name = "shipping", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/shipping" },
    { name = "payment", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/payment" },
    { name = "dispatch", folder = "CI-Pipeline", repo_url = "https://github.com/Bhanudevopss/dispatch" }
  ]
}

variable "s-jobs" {
  default = [
    { name = "roboshop", folder = "Infra", repo_url = "https://github.com/Bhanudevopss/roboshop-infra", filename = "Jenkinsfile" },
    { name = "App-Deployment", folder = "Infra", repo_url = "https://github.com/Bhanudevopss/roboshop-ansible", filename = "Jenkinsfile-deployment" }
  ]
}

variable "force" {
  default = false
}

