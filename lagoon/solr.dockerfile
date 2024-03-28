ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM lagoon/solr-9-drupal:latest

COPY --from=cli /app/web/modules/contrib/search_api_solr/jump-start/solr9/config-set/ /solr-conf/conf

CMD solr-recreate drupal /solr-conf && solr-foreground

# Example adding a second core
# COPY lagoon/drupal-4.3.2-solr-9.x-0/ /solr-conf2/conf
# CMD solr-recreate drupal /solr-conf && solr-recreate more-drupal /solr-conf2 && solr-foreground
