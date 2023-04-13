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

resource "google_compute_security_policy" "policy" {
  project = var.project_id

  name        = var.name
  description = var.description
  type        = var.type

  # -----------------------------------------------------------------------------------------
  # Default Rules
  # -----------------------------------------------------------------------------------------
  dynamic "rule" {
    for_each = var.default_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      description = rule.value.description
    }
  }

  # -----------------------------------------------------------------------------------------
  # Source Geography
  # -----------------------------------------------------------------------------------------
  dynamic "rule" {
    for_each = var.src_geo_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        expr {
          expression = rule.value.expression
        }
      }
      description = rule.value.description
    }
  }
  # -----------------------------------------------------------------------------------------
  # Source IP Address
  # -----------------------------------------------------------------------------------------
  dynamic "rule" {
    for_each = var.src_ip_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      description = rule.value.description
    }
  }
  # -----------------------------------------------------------------------------------------
  # OWASP Rules
  # -----------------------------------------------------------------------------------------
  dynamic "rule" {
    for_each = var.owasp_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        expr {
          expression = rule.value.expression
        }
      }
    }
  }
}
