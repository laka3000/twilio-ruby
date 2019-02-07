##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Autopilot < Domain
      class V1 < Version
        class AssistantContext < InstanceContext
          class TaskContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class TaskActionsList < ListResource
              ##
              # Initialize the TaskActionsList
              # @param [Version] version Version that contains the resource
              # @param [String] assistant_sid The unique ID of the parent Assistant.
              # @param [String] task_sid The unique ID of the Task.
              # @return [TaskActionsList] TaskActionsList
              def initialize(version, assistant_sid: nil, task_sid: nil)
                super(version)

                # Path Solution
                @solution = {assistant_sid: assistant_sid, task_sid: task_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Autopilot.V1.TaskActionsList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class TaskActionsPage < Page
              ##
              # Initialize the TaskActionsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TaskActionsPage] TaskActionsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TaskActionsInstance
              # @param [Hash] payload Payload response from the API
              # @return [TaskActionsInstance] TaskActionsInstance
              def get_instance(payload)
                TaskActionsInstance.new(
                    @version,
                    payload,
                    assistant_sid: @solution[:assistant_sid],
                    task_sid: @solution[:task_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Autopilot.V1.TaskActionsPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class TaskActionsContext < InstanceContext
              ##
              # Initialize the TaskActionsContext
              # @param [Version] version Version that contains the resource
              # @param [String] assistant_sid The unique ID of the parent Assistant.
              # @param [String] task_sid The unique ID of the Task.
              # @return [TaskActionsContext] TaskActionsContext
              def initialize(version, assistant_sid, task_sid)
                super(version)

                # Path Solution
                @solution = {assistant_sid: assistant_sid, task_sid: task_sid, }
                @uri = "/Assistants/#{@solution[:assistant_sid]}/Tasks/#{@solution[:task_sid]}/Actions"
              end

              ##
              # Fetch a TaskActionsInstance
              # @return [TaskActionsInstance] Fetched TaskActionsInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                TaskActionsInstance.new(
                    @version,
                    payload,
                    assistant_sid: @solution[:assistant_sid],
                    task_sid: @solution[:task_sid],
                )
              end

              ##
              # Update the TaskActionsInstance
              # @param [Hash] actions The JSON
              #   [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the
              #   Assistant how to perform this task.
              # @return [TaskActionsInstance] Updated TaskActionsInstance
              def update(actions: :unset)
                data = Twilio::Values.of({'Actions' => Twilio.serialize_object(actions), })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                TaskActionsInstance.new(
                    @version,
                    payload,
                    assistant_sid: @solution[:assistant_sid],
                    task_sid: @solution[:task_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Autopilot.V1.TaskActionsContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Autopilot.V1.TaskActionsContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class TaskActionsInstance < InstanceResource
              ##
              # Initialize the TaskActionsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] assistant_sid The unique ID of the parent Assistant.
              # @param [String] task_sid The unique ID of the Task.
              # @return [TaskActionsInstance] TaskActionsInstance
              def initialize(version, payload, assistant_sid: nil, task_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'assistant_sid' => payload['assistant_sid'],
                    'task_sid' => payload['task_sid'],
                    'url' => payload['url'],
                    'data' => payload['data'],
                }

                # Context
                @instance_context = nil
                @params = {'assistant_sid' => assistant_sid, 'task_sid' => task_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [TaskActionsContext] TaskActionsContext for this TaskActionsInstance
              def context
                unless @instance_context
                  @instance_context = TaskActionsContext.new(@version, @params['assistant_sid'], @params['task_sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The unique ID of the Account that created this Field.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The unique ID of the parent Assistant.
              def assistant_sid
                @properties['assistant_sid']
              end

              ##
              # @return [String] The unique ID of the Task.
              def task_sid
                @properties['task_sid']
              end

              ##
              # @return [String] The url
              def url
                @properties['url']
              end

              ##
              # @return [Hash] The JSON [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the Assistant how to perform this task.
              def data
                @properties['data']
              end

              ##
              # Fetch a TaskActionsInstance
              # @return [TaskActionsInstance] Fetched TaskActionsInstance
              def fetch
                context.fetch
              end

              ##
              # Update the TaskActionsInstance
              # @param [Hash] actions The JSON
              #   [actions](https://www.twilio.com/docs/autopilot/actions) that instruct the
              #   Assistant how to perform this task.
              # @return [TaskActionsInstance] Updated TaskActionsInstance
              def update(actions: :unset)
                context.update(actions: actions, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Autopilot.V1.TaskActionsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Autopilot.V1.TaskActionsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end