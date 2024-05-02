vpc_cidr          = "10.0.0.0/16"
region            = "eu-central-1"
ses_email_reciever = "@gmail.com"
common_resource_name = "lab2"
environment = "Prod"
machine_data={
    type="t2.micro",
    public_ip=true
}

subnets_details=[
    {
        name="public_subnet_1",
        cidr="10.0.1.0/24",
        type="public",
        az = "eu-central-1a"
    },

    {
        name="public_subnet_2",
        cidr="10.0.2.0/24",
        type="public",
        az = "eu-central-1b"
    },

    {
        name="private_subnet_1",
        cidr="10.0.3.0/24",
        type="private",
        az = "eu-central-1a"
    },
    {
        name="private_subnet_2",
        cidr="10.0.4.0/24",
        type="private",
        az = "eu-central-1b"
    }
]