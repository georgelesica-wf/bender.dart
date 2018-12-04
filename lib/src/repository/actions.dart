import 'package:bender/src/action/action.dart';
import 'package:bender/src/repository/bootstrap.dart';
import 'package:bender/src/repository/bump_version.dart';
import 'package:bender/src/repository/create_jira_ticket.dart';
import 'package:bender/src/repository/dart_format.dart';
import 'package:bender/src/repository/deploy_pr.dart';
import 'package:bender/src/repository/merge_master.dart';
import 'package:bender/src/repository/monitor_status.dart';
import 'package:bender/src/repository/pub_get.dart';
import 'package:bender/src/repository/rerun_skynet.dart';
import 'package:bender/src/repository/rerun_smithy.dart';
import 'package:bender/src/repository/test_consumers.dart';
import 'package:bender/src/repository/update_golds.dart';
import 'package:bender/src/repository/update_results.dart';

/// An iterable of all available actions.
Iterable<Action> getAllActions() => [
      getBootstrapAction(),
      getBumpVersionAction(),
      getCreateJiraTicketAction(),
      getDartFormatAction(),
      getDeployPrAction(),
      getMergeMasterAction(),
      getMonitorStatusAction(),
      getPubGetAction(),
      getRerunSkynetAction(),
      getRerunSmithyAction(),
      getTestConsumersAction(),
      getUpdateGoldsAction(),
      getUpdateResultsAction(),
    ];
