##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Chat < Domain
      class V2 < Version
        class ServiceContext < InstanceContext
          class ChannelContext < InstanceContext
            class MessageList < ListResource
              ##
              # Initialize the MessageList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique id of the
              #   [Service](https://www.twilio.com/docs/chat/api/services) this message belongs
              #   to.
              # @param [String] channel_sid The channel_sid
              # @return [MessageList] MessageList
              def initialize(version, service_sid: nil, channel_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages"
              end

              ##
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [String] from The
              #   [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the
              #   message's author. Defaults to `system`.
              # @param [String] attributes An string metadata field you can use to store any
              #   data you wish. The string value must contain structurally valid JSON if
              #   specified. **Note** that this will always be null for resources returned via
              #   LIST GET operations, but will be present for single GET operations.
              # @param [Time] date_created The ISO8601 time specifying the datetime the Message
              #   should be set as being created. Will be set to the current time by the Chat
              #   service if not specified.  Note that this should only be used in cases where a
              #   Chat's history is being recreated from a backup/separate source.
              # @param [Time] date_updated The ISO8601 time specifying the datetime the Message
              #   should be set as having been last updated. Will be set to the `null` by the Chat
              #   service if not specified.  Note that this should only be used in cases where a
              #   Chat's history is being recreated from a backup/separate source  and where a
              #   Message was previously updated.
              # @param [String] last_updated_by Specify the Identity of the User that last
              #   updated the Message (if relevant)
              # @param [String] body A string message to send to this channel. You can also send
              #   structured data by serializing it into a string. May be empty string or `null`,
              #   will be set as empty string as a result in this cases.
              # @param [String] media_sid The
              #   [Media](https://www.twilio.com/docs/api/chat/rest/media) Sid to be attached to
              #   this Message.
              # @return [MessageInstance] Newly created MessageInstance
              def create(from: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, body: :unset, media_sid: :unset)
                data = Twilio::Values.of({
                    'From' => from,
                    'Attributes' => attributes,
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                    'LastUpdatedBy' => last_updated_by,
                    'Body' => body,
                    'MediaSid' => media_sid,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Lists MessageInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [message.OrderType] order Specifies sorting order for messages list,
              #   possible values are: `asc` or `desc`. If no value is specified, then `asc` is
              #   used as the default.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(order: :unset, limit: nil, page_size: nil)
                self.stream(order: order, limit: limit, page_size: page_size).entries
              end

              ##
              # Streams MessageInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [message.OrderType] order Specifies sorting order for messages list,
              #   possible values are: `asc` or `desc`. If no value is specified, then `asc` is
              #   used as the default.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(order: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(order: order, page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields MessageInstance records from the API.
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
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [message.OrderType] order Specifies sorting order for messages list,
              #   possible values are: `asc` or `desc`. If no value is specified, then `asc` is
              #   used as the default.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MessageInstance
              def page(order: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Order' => order,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                MessagePage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of MessageInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of MessageInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                MessagePage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Chat.V2.MessageList>'
              end
            end

            class MessagePage < Page
              ##
              # Initialize the MessagePage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [MessagePage] MessagePage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of MessageInstance
              # @param [Hash] payload Payload response from the API
              # @return [MessageInstance] MessageInstance
              def get_instance(payload)
                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Chat.V2.MessagePage>'
              end
            end

            class MessageContext < InstanceContext
              ##
              # Initialize the MessageContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid Sid of the
              #   [Service](https://www.twilio.com/docs/api/chat/rest/services) this message
              #   belongs to.
              # @param [String] channel_sid Key of the
              #   [Channel](https://www.twilio.com/docs/api/chat/rest/channels) message belongs
              #   to. Could be Sid or UniqueName
              # @param [String] sid Key that uniquely defines the message to fetch.
              # @return [MessageContext] MessageContext
              def initialize(version, service_sid, channel_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, channel_sid: channel_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages/#{@solution[:sid]}"
              end

              ##
              # Fetch a MessageInstance
              # @return [MessageInstance] Fetched MessageInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the MessageInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Update the MessageInstance
              # @param [String] body The message body string. You can also send structured data
              #   by serializing it into a string. May be updated to empty string or `null`, will
              #   be set as empty string as a result in this cases.
              # @param [String] attributes A string metadata field you can use to store any data
              #   you wish. The string value must contain structurally valid JSON if specified.
              #   **Note** that this will always be null for resources returned via LIST GET
              #   operations, but will be present for single GET operations.
              # @param [Time] date_created The ISO8601 time specifying the datetime the Message
              #   should be set as being created.
              # @param [Time] date_updated The ISO8601 time specifying the datetime the Message
              #   should be set as having been last updated.
              # @param [String] last_updated_by Specify the Identity of the User that last
              #   updated the Message (if relevant)
              # @param [String] from The
              #   [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the
              #   message's author.
              # @return [MessageInstance] Updated MessageInstance
              def update(body: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, from: :unset)
                data = Twilio::Values.of({
                    'Body' => body,
                    'Attributes' => attributes,
                    'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                    'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                    'LastUpdatedBy' => last_updated_by,
                    'From' => from,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                MessageInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    channel_sid: @solution[:channel_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.MessageContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Chat.V2.MessageContext #{context}>"
              end
            end

            class MessageInstance < InstanceResource
              ##
              # Initialize the MessageInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique id of the
              #   [Service](https://www.twilio.com/docs/chat/api/services) this message belongs
              #   to.
              # @param [String] channel_sid The channel_sid
              # @param [String] sid Key that uniquely defines the message to fetch.
              # @return [MessageInstance] MessageInstance
              def initialize(version, payload, service_sid: nil, channel_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'attributes' => payload['attributes'],
                    'service_sid' => payload['service_sid'],
                    'to' => payload['to'],
                    'channel_sid' => payload['channel_sid'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'last_updated_by' => payload['last_updated_by'],
                    'was_edited' => payload['was_edited'],
                    'from' => payload['from'],
                    'body' => payload['body'],
                    'index' => payload['index'].to_i,
                    'type' => payload['type'],
                    'media' => payload['media'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'channel_sid' => channel_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [MessageContext] MessageContext for this MessageInstance
              def context
                unless @instance_context
                  @instance_context = MessageContext.new(
                      @version,
                      @params['service_sid'],
                      @params['channel_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A 34 character string that uniquely identifies this resource.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The unique id of the Account responsible for this message.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] A string metadata field you can use to store any data you wish.
              def attributes
                @properties['attributes']
              end

              ##
              # @return [String] The unique id of the Service this message belongs to.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The unique id of the Channel this message was sent to.
              def to
                @properties['to']
              end

              ##
              # @return [String] The channel_sid
              def channel_sid
                @properties['channel_sid']
              end

              ##
              # @return [Time] The date that this resource was created.
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date that this resource was last updated.
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] Field to specify the Identity of the User that last updated the Message
              def last_updated_by
                @properties['last_updated_by']
              end

              ##
              # @return [Boolean] true if the message has been updated since it was created.
              def was_edited
                @properties['was_edited']
              end

              ##
              # @return [String] The identity of the message's author.
              def from
                @properties['from']
              end

              ##
              # @return [String] The contents of the message.
              def body
                @properties['body']
              end

              ##
              # @return [String] The index of the message within the Channel
              def index
                @properties['index']
              end

              ##
              # @return [String] Message type.
              def type
                @properties['type']
              end

              ##
              # @return [Hash] If a Media resource instance is attached to the Message, this will contain the Media object for the attached Media.
              def media
                @properties['media']
              end

              ##
              # @return [String] An absolute URL for this message.
              def url
                @properties['url']
              end

              ##
              # Fetch a MessageInstance
              # @return [MessageInstance] Fetched MessageInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the MessageInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Update the MessageInstance
              # @param [String] body The message body string. You can also send structured data
              #   by serializing it into a string. May be updated to empty string or `null`, will
              #   be set as empty string as a result in this cases.
              # @param [String] attributes A string metadata field you can use to store any data
              #   you wish. The string value must contain structurally valid JSON if specified.
              #   **Note** that this will always be null for resources returned via LIST GET
              #   operations, but will be present for single GET operations.
              # @param [Time] date_created The ISO8601 time specifying the datetime the Message
              #   should be set as being created.
              # @param [Time] date_updated The ISO8601 time specifying the datetime the Message
              #   should be set as having been last updated.
              # @param [String] last_updated_by Specify the Identity of the User that last
              #   updated the Message (if relevant)
              # @param [String] from The
              #   [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the
              #   message's author.
              # @return [MessageInstance] Updated MessageInstance
              def update(body: :unset, attributes: :unset, date_created: :unset, date_updated: :unset, last_updated_by: :unset, from: :unset)
                context.update(
                    body: body,
                    attributes: attributes,
                    date_created: date_created,
                    date_updated: date_updated,
                    last_updated_by: last_updated_by,
                    from: from,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.MessageInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Chat.V2.MessageInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end