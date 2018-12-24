import 'package:bender/src/action/action.dart';
import 'package:bender/src/repository/abide_update.dart';
import 'package:bender/src/repository/bootstrap.dart';
import 'package:bender/src/repository/branch_merge_master.dart';
import 'package:bender/src/repository/bump_version.dart';
import 'package:bender/src/repository/create_jira_ticket.dart';
import 'package:bender/src/repository/cut_release.dart';
import 'package:bender/src/repository/dart_format.dart';
import 'package:bender/src/repository/deploy_pr.dart';
import 'package:bender/src/repository/detect_conflict.dart';
import 'package:bender/src/repository/merge_master.dart';
import 'package:bender/src/repository/monitor_status.dart';
import 'package:bender/src/repository/pub_get.dart';
import 'package:bender/src/repository/rerun_build.dart';
import 'package:bender/src/repository/test_branch.dart';
import 'package:bender/src/repository/test_consumers.dart';
import 'package:bender/src/repository/update_dart_deps.dart';
import 'package:bender/src/repository/update_golds.dart';

/// Return an iterable of unique instances of all available actions.
Iterable<Action> getAllActions() => [
      getAbideUpdateAction(),
      getBootstrapAction(),
      getBranchMergeMasterAction(),
      getBumpVersionAction(),
      getCreateJiraTicketAction(),
      getCutReleaseAction(),
      getDartFormatAction(),
      getDeployPrAction(),
      getDetectConflictAction(),
      getMergeMasterAction(),
      getMonitorStatusAction(),
      getPubGetAction(),
      getRerunBuildAction(),
      getTestBranchAction(),
      getTestConsumersAction(),
      getUpdateDartDepsAction(),
      getUpdateGoldsAction(),
    ];
