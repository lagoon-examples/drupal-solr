ARG CLI_IMAGE
FROM ${CLI_IMAGE} AS cli

FROM uselagoon/solr-8-drupal:latest

COPY --from=cli /app/web/modules/contrib/search_api_solr/jump-start/solr8/config-set/ /solr-conf/conf

CMD solr-recreate drupal /solr-conf && solr-foreground

# Example adding a second core
# COPY lagoon/drupal-4.2.7-solr-8.x-1/ /solr-conf2/conf
# CMD solr-recreate drupal /solr-conf && solr-recreate more-drupal /solr-conf2 && solr-foreground
