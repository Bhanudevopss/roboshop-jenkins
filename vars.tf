variable "folders" {
  default = [ "Infra" ]
}

variable "jobs" {
  default = [
    { name = "Infra/roboshop", repo_url = "https://github.com/Bhanudevopss/roboshop-infra" }
  ]
}

