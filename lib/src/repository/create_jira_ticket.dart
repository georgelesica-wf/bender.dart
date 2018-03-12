import 'package:bender/src/action/action.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

final Action createJiraTicket = new ActionImpl(
  getMessage: (context) {
    var prUrl = context.parameters
        .firstWhere((param) => param.name == 'pr-url')
        .parsedValue;
    var project = context.parameters
        .firstWhere((param) => param.name == 'project')
        .parsedValue;

    if (project == '') {
      return 'ticket $prUrl';
    }

    return 'rogue ticket $prUrl $project';
  },
  helpText: 'Create a JIRA ticket for the given PR',
  name: 'Create JIRA Ticket',
  parameters: [
    new PrParameter(
      helpText: 'The URL of the PR to act upon',
      name: 'pr-url',
    ),
    new StringParameter(
      helpText: 'The project in which to create the new ticket (optional)',
      name: 'project',
    ),
  ],
);
