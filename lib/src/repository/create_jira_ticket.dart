import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

Action getCreateJiraTicketAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        final project = parameterValue<String>(context, 'project');

        if (project == '') {
          return 'ticket $prUrl';
        }

        return 'rogue ticket $prUrl $project';
      },
      helpText: 'Create a JIRA ticket for the given PR',
      name: 'Create JIRA Ticket',
      parameters: [
        new PrParameter(),
        new StringParameter(
          helpText: 'The project in which to create the new ticket (optional)',
          name: 'project',
        ),
      ],
    );
