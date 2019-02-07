##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class SipList < ListResource
            class DomainContext < InstanceContext
              class AuthTypesList < ListResource
                class AuthTypeCallsList < ListResource
                  class AuthCallsIpAccessControlListMappingList < ListResource
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingList
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   SipDomain resource.
                    # @param [String] domain_sid The unique string that that we created to identify
                    #   the SipDomain resource.
                    # @return [AuthCallsIpAccessControlListMappingList] AuthCallsIpAccessControlListMappingList
                    def initialize(version, account_sid: nil, domain_sid: nil)
                      super(version)

                      # Path Solution
                      @solution = {account_sid: account_sid, domain_sid: domain_sid}
                      @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Calls/IpAccessControlListMappings.json"
                    end

                    ##
                    # Retrieve a single page of AuthCallsIpAccessControlListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] ip_access_control_list_sid The SID of the IpAccessControlList
                    #   resource to map to the SIP domain.
                    # @return [AuthCallsIpAccessControlListMappingInstance] Newly created AuthCallsIpAccessControlListMappingInstance
                    def create(ip_access_control_list_sid: nil)
                      data = Twilio::Values.of({'IpAccessControlListSid' => ip_access_control_list_sid, })

                      payload = @version.create(
                          'POST',
                          @uri,
                          data: data
                      )

                      AuthCallsIpAccessControlListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                      )
                    end

                    ##
                    # Lists AuthCallsIpAccessControlListMappingInstance records from the API as a list.
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
                    # Streams AuthCallsIpAccessControlListMappingInstance records from the API as an Enumerable.
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
                    # When passed a block, yields AuthCallsIpAccessControlListMappingInstance records from the API.
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
                    # Retrieve a single page of AuthCallsIpAccessControlListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AuthCallsIpAccessControlListMappingInstance
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
                      AuthCallsIpAccessControlListMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AuthCallsIpAccessControlListMappingInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AuthCallsIpAccessControlListMappingInstance
                    def get_page(target_url)
                      response = @version.domain.request(
                          'GET',
                          target_url
                      )
                      AuthCallsIpAccessControlListMappingPage.new(@version, response, @solution)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      '#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingList>'
                    end
                  end

                  class AuthCallsIpAccessControlListMappingPage < Page
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AuthCallsIpAccessControlListMappingPage] AuthCallsIpAccessControlListMappingPage
                    def initialize(version, response, solution)
                      super(version, response)

                      # Path Solution
                      @solution = solution
                    end

                    ##
                    # Build an instance of AuthCallsIpAccessControlListMappingInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AuthCallsIpAccessControlListMappingInstance] AuthCallsIpAccessControlListMappingInstance
                    def get_instance(payload)
                      AuthCallsIpAccessControlListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                      )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      '<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingPage>'
                    end
                  end

                  class AuthCallsIpAccessControlListMappingContext < InstanceContext
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   IpAccessControlListMapping resource to fetch.
                    # @param [String] domain_sid The SID of the SIP domain that contains the resource
                    #   to fetch.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the
                    #   IpAccessControlListMapping resource to fetch.
                    # @return [AuthCallsIpAccessControlListMappingContext] AuthCallsIpAccessControlListMappingContext
                    def initialize(version, account_sid, domain_sid, sid)
                      super(version)

                      # Path Solution
                      @solution = {account_sid: account_sid, domain_sid: domain_sid, sid: sid, }
                      @uri = "/Accounts/#{@solution[:account_sid]}/SIP/Domains/#{@solution[:domain_sid]}/Auth/Calls/IpAccessControlListMappings/#{@solution[:sid]}.json"
                    end

                    ##
                    # Fetch a AuthCallsIpAccessControlListMappingInstance
                    # @return [AuthCallsIpAccessControlListMappingInstance] Fetched AuthCallsIpAccessControlListMappingInstance
                    def fetch
                      params = Twilio::Values.of({})

                      payload = @version.fetch(
                          'GET',
                          @uri,
                          params,
                      )

                      AuthCallsIpAccessControlListMappingInstance.new(
                          @version,
                          payload,
                          account_sid: @solution[:account_sid],
                          domain_sid: @solution[:domain_sid],
                          sid: @solution[:sid],
                      )
                    end

                    ##
                    # Deletes the AuthCallsIpAccessControlListMappingInstance
                    # @return [Boolean] true if delete succeeds, true otherwise
                    def delete
                      @version.delete('delete', @uri)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                      "#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                      context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                      "#<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingContext #{context}>"
                    end
                  end

                  class AuthCallsIpAccessControlListMappingInstance < InstanceResource
                    ##
                    # Initialize the AuthCallsIpAccessControlListMappingInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                    #   SipDomain resource.
                    # @param [String] domain_sid The unique string that that we created to identify
                    #   the SipDomain resource.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the
                    #   IpAccessControlListMapping resource to fetch.
                    # @return [AuthCallsIpAccessControlListMappingInstance] AuthCallsIpAccessControlListMappingInstance
                    def initialize(version, payload, account_sid: nil, domain_sid: nil, sid: nil)
                      super(version)

                      # Marshaled Properties
                      @properties = {
                          'account_sid' => payload['account_sid'],
                          'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                          'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                          'friendly_name' => payload['friendly_name'],
                          'sid' => payload['sid'],
                      }

                      # Context
                      @instance_context = nil
                      @params = {
                          'account_sid' => account_sid,
                          'domain_sid' => domain_sid,
                          'sid' => sid || @properties['sid'],
                      }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AuthCallsIpAccessControlListMappingContext] AuthCallsIpAccessControlListMappingContext for this AuthCallsIpAccessControlListMappingInstance
                    def context
                      unless @instance_context
                        @instance_context = AuthCallsIpAccessControlListMappingContext.new(
                            @version,
                            @params['account_sid'],
                            @params['domain_sid'],
                            @params['sid'],
                        )
                      end
                      @instance_context
                    end

                    ##
                    # @return [String] The SID of the Account that created the resource
                    def account_sid
                      @properties['account_sid']
                    end

                    ##
                    # @return [Time] The RFC 2822 date and time in GMT that the resource was created
                    def date_created
                      @properties['date_created']
                    end

                    ##
                    # @return [Time] The RFC 2822 date and time in GMT that the resource was last updated
                    def date_updated
                      @properties['date_updated']
                    end

                    ##
                    # @return [String] The string that you assigned to describe the resource
                    def friendly_name
                      @properties['friendly_name']
                    end

                    ##
                    # @return [String] The unique string that identifies the resource
                    def sid
                      @properties['sid']
                    end

                    ##
                    # Fetch a AuthCallsIpAccessControlListMappingInstance
                    # @return [AuthCallsIpAccessControlListMappingInstance] Fetched AuthCallsIpAccessControlListMappingInstance
                    def fetch
                      context.fetch
                    end

                    ##
                    # Deletes the AuthCallsIpAccessControlListMappingInstance
                    # @return [Boolean] true if delete succeeds, true otherwise
                    def delete
                      context.delete
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                      values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                      "<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                      values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                      "<Twilio.Api.V2010.AuthCallsIpAccessControlListMappingInstance #{values}>"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end