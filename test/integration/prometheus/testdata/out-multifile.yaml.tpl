
---
# Code generated by Sloth ({{ .version }}): https://github.com/slok/sloth.
# DO NOT EDIT.

groups:
- name: sloth-slo-sli-recordings-svc01-slo1
  rules:
  - record: slo:sli_error:ratio_rate5m
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[5m])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[5m])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 5m
  - record: slo:sli_error:ratio_rate30m
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[30m])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[30m])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 30m
  - record: slo:sli_error:ratio_rate1h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[1h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 1h
  - record: slo:sli_error:ratio_rate2h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[2h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[2h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 2h
  - record: slo:sli_error:ratio_rate6h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[6h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[6h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 6h
  - record: slo:sli_error:ratio_rate1d
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1d])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[1d])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 1d
  - record: slo:sli_error:ratio_rate3d
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[3d])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[3d])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 3d
  - record: slo:sli_error:ratio_rate30d
    expr: |
      sum_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}[30d])
      /
      count_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}[30d])
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
      sloth_window: 30d
- name: sloth-slo-meta-recordings-svc01-slo1
  rules:
  - record: slo:objective:ratio
    expr: vector(0.9990000000000001)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: slo:error_budget:ratio
    expr: vector(1-0.9990000000000001)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: slo:time_period:days
    expr: vector(30)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: slo:current_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: slo:period_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate30d{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: slo:period_error_budget_remaining:ratio
    expr: 1 - slo:period_burn_rate:ratio{sloth_id="svc01-slo1", sloth_service="svc01",
      sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_service: svc01
      sloth_slo: slo1
  - record: sloth_slo_info
    expr: vector(1)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc01-slo1
      sloth_mode: cli-gen-prom
      sloth_objective: "99.9"
      sloth_service: svc01
      sloth_slo: slo1
      sloth_spec: prometheus/v1
      sloth_version: {{ .version }}
- name: sloth-slo-alerts-svc01-slo1
  rules:
  - alert: myServiceAlert
    expr: |
      (
          max(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (14.4 * 0.0009999999999999432)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate1h{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (14.4 * 0.0009999999999999432)) without (sloth_window)
      )
      or
      (
          max(slo:sli_error:ratio_rate30m{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (6 * 0.0009999999999999432)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate6h{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (6 * 0.0009999999999999432)) without (sloth_window)
      )
    labels:
      alert01k1: alert01v1
      alert03k1: alert03v1
      sloth_severity: page
    annotations:
      alert02k1: alert02k2
      summary: '{{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget burn
        rate is over expected.'
      title: (page) {{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget
        burn rate is too fast.
  - alert: myServiceAlert
    expr: |
      (
          max(slo:sli_error:ratio_rate2h{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (3 * 0.0009999999999999432)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate1d{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (3 * 0.0009999999999999432)) without (sloth_window)
      )
      or
      (
          max(slo:sli_error:ratio_rate6h{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (1 * 0.0009999999999999432)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate3d{sloth_id="svc01-slo1", sloth_service="svc01", sloth_slo="slo1"} > (1 * 0.0009999999999999432)) without (sloth_window)
      )
    labels:
      alert01k1: alert01v1
      alert04k1: alert04v1
      sloth_severity: ticket
    annotations:
      alert02k1: alert02k2
      summary: '{{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget burn
        rate is over expected.'
      title: (ticket) {{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget
        burn rate is too fast.
- name: sloth-slo-sli-recordings-svc01-slo02
  rules:
  - record: slo:sli_error:ratio_rate5m
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[5m]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[5m]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 5m
  - record: slo:sli_error:ratio_rate30m
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[30m]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[30m]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 30m
  - record: slo:sli_error:ratio_rate1h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[1h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 1h
  - record: slo:sli_error:ratio_rate2h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[2h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[2h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 2h
  - record: slo:sli_error:ratio_rate6h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[6h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[6h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 6h
  - record: slo:sli_error:ratio_rate1d
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1d]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[1d]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 1d
  - record: slo:sli_error:ratio_rate3d
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[3d]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[3d]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 3d
  - record: slo:sli_error:ratio_rate30d
    expr: |
      sum_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}[30d])
      /
      count_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}[30d])
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
      sloth_window: 30d
- name: sloth-slo-meta-recordings-svc01-slo02
  rules:
  - record: slo:objective:ratio
    expr: vector(0.95)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: slo:error_budget:ratio
    expr: vector(1-0.95)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: slo:time_period:days
    expr: vector(30)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: slo:current_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate5m{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: slo:period_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate30d{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc01-slo02", sloth_service="svc01", sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: slo:period_error_budget_remaining:ratio
    expr: 1 - slo:period_burn_rate:ratio{sloth_id="svc01-slo02", sloth_service="svc01",
      sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_service: svc01
      sloth_slo: slo02
  - record: sloth_slo_info
    expr: vector(1)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc01-slo02
      sloth_mode: cli-gen-prom
      sloth_objective: "95"
      sloth_service: svc01
      sloth_slo: slo02
      sloth_spec: prometheus/v1
      sloth_version: {{ .version }}

---
# Code generated by Sloth ({{ .version }}): https://github.com/slok/sloth.
# DO NOT EDIT.

groups:
- name: sloth-slo-sli-recordings-svc02-slo1
  rules:
  - record: slo:sli_error:ratio_rate5m
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[5m])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[5m])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 5m
  - record: slo:sli_error:ratio_rate30m
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[30m])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[30m])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 30m
  - record: slo:sli_error:ratio_rate1h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[1h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 1h
  - record: slo:sli_error:ratio_rate2h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[2h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[2h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 2h
  - record: slo:sli_error:ratio_rate6h
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[6h])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[6h])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 6h
  - record: slo:sli_error:ratio_rate1d
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1d])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[1d])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 1d
  - record: slo:sli_error:ratio_rate3d
    expr: |
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[3d])))
      /
      (sum(rate(http_request_duration_seconds_count{job="myservice"}[3d])))
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 3d
  - record: slo:sli_error:ratio_rate30d
    expr: |
      sum_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}[30d])
      /
      count_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}[30d])
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
      sloth_window: 30d
- name: sloth-slo-meta-recordings-svc02-slo1
  rules:
  - record: slo:objective:ratio
    expr: vector(0.9998999999999999)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: slo:error_budget:ratio
    expr: vector(1-0.9998999999999999)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: slo:time_period:days
    expr: vector(30)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: slo:current_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate5m{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: slo:period_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate30d{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: slo:period_error_budget_remaining:ratio
    expr: 1 - slo:period_burn_rate:ratio{sloth_id="svc02-slo1", sloth_service="svc02",
      sloth_slo="slo1"}
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_service: svc02
      sloth_slo: slo1
  - record: sloth_slo_info
    expr: vector(1)
    labels:
      global01k1: global01v1
      global02k1: global02v1
      sloth_id: svc02-slo1
      sloth_mode: cli-gen-prom
      sloth_objective: "99.99"
      sloth_service: svc02
      sloth_slo: slo1
      sloth_spec: prometheus/v1
      sloth_version: {{ .version }}
- name: sloth-slo-alerts-svc02-slo1
  rules:
  - alert: myServiceAlert
    expr: |
      (
          max(slo:sli_error:ratio_rate5m{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (14.4 * 0.00010000000000005117)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate1h{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (14.4 * 0.00010000000000005117)) without (sloth_window)
      )
      or
      (
          max(slo:sli_error:ratio_rate30m{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (6 * 0.00010000000000005117)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate6h{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (6 * 0.00010000000000005117)) without (sloth_window)
      )
    labels:
      alert01k1: alert01v1
      alert03k1: alert03v1
      sloth_severity: page
    annotations:
      alert02k1: alert02k2
      summary: '{{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget burn
        rate is over expected.'
      title: (page) {{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget
        burn rate is too fast.
  - alert: myServiceAlert
    expr: |
      (
          max(slo:sli_error:ratio_rate2h{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (3 * 0.00010000000000005117)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate1d{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (3 * 0.00010000000000005117)) without (sloth_window)
      )
      or
      (
          max(slo:sli_error:ratio_rate6h{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (1 * 0.00010000000000005117)) without (sloth_window)
          and
          max(slo:sli_error:ratio_rate3d{sloth_id="svc02-slo1", sloth_service="svc02", sloth_slo="slo1"} > (1 * 0.00010000000000005117)) without (sloth_window)
      )
    labels:
      alert01k1: alert01v1
      alert04k1: alert04v1
      sloth_severity: ticket
    annotations:
      alert02k1: alert02k2
      summary: '{{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget burn
        rate is over expected.'
      title: (ticket) {{"{{$labels.sloth_service}}"}} {{"{{$labels.sloth_slo}}"}} SLO error budget
        burn rate is too fast.
- name: sloth-slo-sli-recordings-svc02-slo02
  rules:
  - record: slo:sli_error:ratio_rate5m
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[5m]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[5m]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 5m
  - record: slo:sli_error:ratio_rate30m
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[30m]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[30m]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 30m
  - record: slo:sli_error:ratio_rate1h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[1h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 1h
  - record: slo:sli_error:ratio_rate2h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[2h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[2h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 2h
  - record: slo:sli_error:ratio_rate6h
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[6h]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[6h]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 6h
  - record: slo:sli_error:ratio_rate1d
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[1d]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[1d]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 1d
  - record: slo:sli_error:ratio_rate3d
    expr: |-
      (sum(rate(http_request_duration_seconds_count{job="myservice",code=~"(5..|429)"}[3d]))
      /
      sum(rate(http_request_duration_seconds_count{job="myservice"}[3d]))
      )
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 3d
  - record: slo:sli_error:ratio_rate30d
    expr: |
      sum_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}[30d])
      /
      count_over_time(slo:sli_error:ratio_rate5m{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}[30d])
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
      sloth_window: 30d
- name: sloth-slo-meta-recordings-svc02-slo02
  rules:
  - record: slo:objective:ratio
    expr: vector(0.95)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: slo:error_budget:ratio
    expr: vector(1-0.95)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: slo:time_period:days
    expr: vector(30)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: slo:current_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate5m{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: slo:period_burn_rate:ratio
    expr: |
      slo:sli_error:ratio_rate30d{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}
      / on(sloth_id, sloth_slo, sloth_service) group_left
      slo:error_budget:ratio{sloth_id="svc02-slo02", sloth_service="svc02", sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: slo:period_error_budget_remaining:ratio
    expr: 1 - slo:period_burn_rate:ratio{sloth_id="svc02-slo02", sloth_service="svc02",
      sloth_slo="slo02"}
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_service: svc02
      sloth_slo: slo02
  - record: sloth_slo_info
    expr: vector(1)
    labels:
      global01k1: global01v1
      global03k1: global03v1
      sloth_id: svc02-slo02
      sloth_mode: cli-gen-prom
      sloth_objective: "95"
      sloth_service: svc02
      sloth_slo: slo02
      sloth_spec: prometheus/v1
      sloth_version: {{ .version }}
