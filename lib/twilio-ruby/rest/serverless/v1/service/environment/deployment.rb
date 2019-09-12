##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class EnvironmentContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class DeploymentList < ListResource
              ##
              # Initialize the DeploymentList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Deployment.
              # @param [String] environment_sid The unique SID identifier of the Environment for
              #   this Deployment.
              # @return [DeploymentList] DeploymentList
              def initialize(version, service_sid: nil, environment_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Deployments"
              end

              ##
              # Lists DeploymentInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams DeploymentInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields DeploymentInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of DeploymentInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of DeploymentInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                DeploymentPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DeploymentInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of DeploymentInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                DeploymentPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of DeploymentInstance records from the API.
              # Request is executed immediately.
              # @param [String] build_sid The unique SID identifier of the Build to be deployed
              #   for this Deployment. Required.
              # @return [DeploymentInstance] Newly created DeploymentInstance
              def create(build_sid: nil)
                data = Twilio::Values.of({'BuildSid' => build_sid, })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                DeploymentInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.DeploymentList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class DeploymentPage < Page
              ##
              # Initialize the DeploymentPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [DeploymentPage] DeploymentPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of DeploymentInstance
              # @param [Hash] payload Payload response from the API
              # @return [DeploymentInstance] DeploymentInstance
              def get_instance(payload)
                DeploymentInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.DeploymentPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class DeploymentContext < InstanceContext
              ##
              # Initialize the DeploymentContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Deployment.
              # @param [String] environment_sid The unique SID identifier of the Environment for
              #   this Deployment.
              # @param [String] sid The unique SID identifier of this Deployment.
              # @return [DeploymentContext] DeploymentContext
              def initialize(version, service_sid, environment_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, environment_sid: environment_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Environments/#{@solution[:environment_sid]}/Deployments/#{@solution[:sid]}"
              end

              ##
              # Fetch a DeploymentInstance
              # @return [DeploymentInstance] Fetched DeploymentInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                DeploymentInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    environment_sid: @solution[:environment_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.DeploymentContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.DeploymentContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class DeploymentInstance < InstanceResource
              ##
              # Initialize the DeploymentInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Deployment.
              # @param [String] environment_sid The unique SID identifier of the Environment for
              #   this Deployment.
              # @param [String] sid The unique SID identifier of this Deployment.
              # @return [DeploymentInstance] DeploymentInstance
              def initialize(version, payload, service_sid: nil, environment_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'environment_sid' => payload['environment_sid'],
                    'build_sid' => payload['build_sid'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'environment_sid' => environment_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [DeploymentContext] DeploymentContext for this DeploymentInstance
              def context
                unless @instance_context
                  @instance_context = DeploymentContext.new(
                      @version,
                      @params['service_sid'],
                      @params['environment_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] Deployment Sid.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Environment Sid.
              def environment_sid
                @properties['environment_sid']
              end

              ##
              # @return [String] Build Sid.
              def build_sid
                @properties['build_sid']
              end

              ##
              # @return [Time] The date that this Deployment was created.
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date that this Deployment was updated.
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The URL of this Deployment.
              def url
                @properties['url']
              end

              ##
              # Fetch a DeploymentInstance
              # @return [DeploymentInstance] Fetched DeploymentInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.DeploymentInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.DeploymentInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end