import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/monitor_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

const String serviceParameterName = 'service';

Action getMonitorStatusAction() => new ActionImpl(
      getMessage: (context) {
        final monitorUrl =
            parameterValue<Uri>(context, MonitorParameter.parameterName);
        final service = parameterValue<String>(context, serviceParameterName);
        if (service == '') {
          return 'monitor $monitorUrl';
        }
        return 'monitor $monitorUrl --deploy=$service';
      },
      helpText: 'Monitor the status of a PR or Shipyard build',
      name: 'Monitor Status (PR)',
      parameters: [
        new MonitorParameter(),
        new StringParameter(
          helpText: 'Target deploy service',
          name: serviceParameterName,
        ),
      ],
    );
