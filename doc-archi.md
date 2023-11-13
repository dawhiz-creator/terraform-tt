## Architecture Overview:

The infrastructure consists of an internal AWS Application Load Balancer (ALB) named "PrivateALB" with HTTPS and HTTP listeners. There are specific listeners and rules defined for VPN and GitLab services.

* **Load Balancer (ALB):**
  * Name: PrivateALB
  * Type: Internal
  * Load Balancer Type: Application
  * Security Groups: Defined by `aws_security_group.alb`
  * Subnets: Three private subnets specified in `data.tf`
  * Other Configurations: Drop invalid header fields, Deletion protection disabled, and tags.
* **Listeners and Rules:**
  * HTTPS Listener:
    * Port: 443, Protocol: HTTPS
    * Default Action: Forward to various Target Groups based on rules.
  * HTTP Listener:
    * Port: 80, Protocol: HTTP
    * Default Action: Redirect to HTTPS (Port 443)
* **VPN and GitLab Services:**
  * VPN Service:
    * Listener Rule: Matches traffic for VPN.
    * Forward to VPN Target Group.
    * DNS Record (Route 53): Alias to ALB for VPN subdomain.
  * GitLab Service:
    * Listener Rule: Matches traffic for GitLab.
    * Forward to GitLab Target Group.
    * DNS Record (Route 53): Alias to ALB for GitLab domain.
* **Shared DNS Records:**
  * Shared DNS records pointing to the ALB for general services.

## Files Overview:

1. **alb.tf:**

   * Defines the AWS ALB resource with its configuration.
2. **data.tf:**

   * Contains data sources to fetch information about VPC, subnets, and Route 53 zones.
3. **listeners.tf:**Defines listeners for HTTPS and HTTP on the ALB.

   Specifies rules for VPN and GitLab services.
4. **zone_records.tf:**

   * Defines Route 53 DNS records for VPN, GitLab, and shared services.


code's module structure:

project/
|-- main.tf
|-- variables.tf
|-- modules/
|   |-- alb/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |-- data/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- gitlab_certificates/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |-- listeners/
|   |   |-- main.tf
|   |   |-- variables.tf
|   |-- security_group/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |-- shared_certificates/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |-- target_group/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- vpn_certificates/
|   |   |-- main.tf
|   |   |-- outputs.tf
|   |   |-- variables.tf
|   |-- zone_records/
|   |   |-- main.tf
|   |   |-- variables.tf
