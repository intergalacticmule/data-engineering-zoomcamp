## Question 6

>How would you configure the timezone to New York in a Schedule trigger?
>- Add a _timezone_ property set to _EST_ in the _Schedule_ trigger configuration
>- Add a _timezone_ property set to _America/New_York_ in the _Schedule_ trigger configuration
>- Add a _timezone_ property set to _UTC-5_ in the _Schedule_ trigger configuration
>- Add a _location_ property set to _New_York_ in the _Schedule_ trigger configuration

### Solution

According to [Kestra docs](https://kestra.io/docs/workflow-components/triggers/schedule-trigger), the proper way to set a TZ to a schedule trigger is as follows:

```yaml
triggers:
  - id: daily
    type: io.kestra.plugin.core.trigger.Schedule
    cron: "@daily"
    timezone: America/New_York
```

## Final result:
timezone: America/New_York
