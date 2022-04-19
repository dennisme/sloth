
---
# Code generated by Sloth ({{ .version }}): https://github.com/slok/sloth.
# DO NOT EDIT.

groups:
- name: sloth-slo-sli-recordings-svc01-slo1
  rules:
  - record: slo:sli_error:ratio_rate5m
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[5m]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[5m])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 5m
      tier: "2"
  - record: slo:sli_error:ratio_rate30m
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[30m]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[30m])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 30m
      tier: "2"
  - record: slo:sli_error:ratio_rate1h
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[1h]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[1h])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 1h
      tier: "2"
  - record: slo:sli_error:ratio_rate2h
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[2h]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[2h])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 2h
      tier: "2"
  - record: slo:sli_error:ratio_rate6h
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[6h]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[6h])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 6h
      tier: "2"
  - record: slo:sli_error:ratio_rate1d
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[1d]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[1d])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 1d
      tier: "2"
  - record: slo:sli_error:ratio_rate3d
    expr: |-
      (
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01",code=~"(5..|429)" }[3d]))
      /
      sum(rate(integration_test{ guybrush="threepwood",melee="island",job="svc01" }[3d])))
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 3d
      tier: "2"
  - record: slo:sli_error:ratio_rate30d
    expr: |
      sum_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}[30d])
      /
      count_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}[30d])
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 30d
      tier: "2"
- name: sloth-slo-meta-recordings-svc01-slo1
  rules:
  - record: slo:objective:ratio
    expr: vector(0.9990000000000001)
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: slo:error_budget:ratio
    expr: vector(1-0.9990000000000001)
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: slo:time_period:days
    expr: vector(30)
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: slo:current_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: slo:period_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate30d{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: slo:period_error_budget_remaining:ratio
    expr: 1 - slo:period_burn_rate:ratio{sloth_id="svc01-slo1", sloth_service="svc01",
      sloth_slo="slo1"}
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      tier: "2"
  - record: sloth_slo_info
    expr: vector(1)
    labels:
      owner: myteam
      sloth_id: svc01-slo1
      sloth_mode: cli-gen-prom
      sloth_objective: "99.9"
      sloth_service: svc01
      sloth_slo: slo1
      sloth_spec: prometheus/v1
      sloth_version: {{ .version }}
      tier: "2"
