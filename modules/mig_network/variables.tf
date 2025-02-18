/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "Google Project ID"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region in which to create resources"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = ""
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = ""
}

variable "subnet_ip" {
  description = "This is th IP of your subnet"
  type        = string
  default     = ""
}

variable "subnet_region" {
  description = "Subnet Region"
  type        = string
  default     = ""
}
