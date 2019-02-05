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
                ##
                # Initialize the AuthTypesList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The SID of the
                #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                #   SipDomain resource.
                # @param [String] domain_sid The unique string that that we created to identify
                #   the SipDomain resource.
                # @return [AuthTypesList] AuthTypesList
                def initialize(version, account_sid: nil, domain_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {account_sid: account_sid, domain_sid: domain_sid}

                  # Components
                  @calls = nil
                  @registrations = nil
                end

                ##
                # Access the calls
                # @return [AuthTypeCallsList]
                # @return [AuthTypeCallsContext]
                def calls
                  @calls ||= AuthTypeCallsList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                  )
                end

                ##
                # Access the registrations
                # @return [AuthTypeRegistrationsList]
                # @return [AuthTypeRegistrationsContext]
                def registrations
                  @registrations ||= AuthTypeRegistrationsList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.AuthTypesList>'
                end
              end

              class AuthTypesPage < Page
                ##
                # Initialize the AuthTypesPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [AuthTypesPage] AuthTypesPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of AuthTypesInstance
                # @param [Hash] payload Payload response from the API
                # @return [AuthTypesInstance] AuthTypesInstance
                def get_instance(payload)
                  AuthTypesInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      domain_sid: @solution[:domain_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.AuthTypesPage>'
                end
              end

              class AuthTypesInstance < InstanceResource
                ##
                # Initialize the AuthTypesInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The SID of the
                #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
                #   SipDomain resource.
                # @param [String] domain_sid The unique string that that we created to identify
                #   the SipDomain resource.
                # @return [AuthTypesInstance] AuthTypesInstance
                def initialize(version, payload, account_sid: nil, domain_sid: nil)
                  super(version)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  "<Twilio.Api.V2010.AuthTypesInstance>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  "<Twilio.Api.V2010.AuthTypesInstance>"
                end
              end
            end
          end
        end
      end
    end
  end
end