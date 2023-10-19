<?php
require_once './config.php';
require 'Calendar.php';

$calendar = new Calendar(new CurrentDate(), new CalendarDate() );

$calendar->setSundayFirst(false);

$calendar->create();

$userId=$_SESSION['user_id'];
$annualLeave;
$childBorn;
$deathofFamilyMember;
$movingDay;
$weddingDay;
$sickLeave;

$currentTime = date('h:i A');

$sql="  SELECT * FROM timeoff WHERE User_ID = $userId";
$prep= $con->prepare($sql);

$prep->execute();
$data= $prep->fetch();

    $annualLeave = $data['annual_leave'];
    $childBorn = $data['child_born'];
    $deathofFamilyMember = $data['death_of_family_member'];
    $movingDay = $data['moving_day'];
    $weddingDay = $data['wedding_day'];
    $sickLeave = $data['sick_leave'];





?>

<head>
    <script src="https://kit.fontawesome.com/3d560ffcbd.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/home.css">
</head>

<body>
    <div id="main">
        <div class="name">
            <h2>MetDaan</h2>
        </div>
        <div style="height:20px;"></div>
        <div class="homeHead">
            <?php echo '<h2>' . $_SESSION['name'] . '</h2>'; ?>
            <?php echo '<h4>' . $_SESSION['position'] . '</h4>'; ?>
        </div>
        <div class="shortcuts">
            <div class="shortcutsHead">
                <h4>
                    <i class="fa-solid fa-star"></i>
                    Shortcuts
                </h4>
            </div>
            <div class="shortcutsBody">
                <div class="shortcutsBodyElements">
                    <img src="./images/request_leave5.png" alt="" width="48px" height="48px">
                    <h3>Request Time-Off</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/company_directory.png" alt="" width="48px" height="48px">
                    <h3>Company Directory</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/employee_profile.png" alt="" width="48px" height="48px">
                    <h3>My Profile</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/fill_checklist.png" alt="" width="48px" height="48px">
                    <h3>Complete Checklist</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/company_org_chart.png" alt="" width="48px" height="48px">
                    <h3>Company Org. Chart</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/read_news_female.png" alt="" width="48px" height="48px">
                    <h3>News</h3>
                </div>
                <div class="shortcutsBodyElements">
                    <img src="./images/expense_claim3.png" alt="" width="48px" height="48px">
                    <h3>File an Expens Claim</h3>
                </div>
            </div>

        </div>
        <div class="thirdContainer">
            <div class="leftDiv">
                <div class="Activechecklists">
                    <div class="ActivechecklistsHead">
                        <h5>
                            <img src="./images/checklist.png" alt="" height="24px" width="24px">
                            Active Checklists
                        </h5>
                    </div>
                    <div class="ActivechecklistsBody">
                        <div class="ActivechecklistsNotification">
                            <p>
                                <em> You have 1 active checklist that needs completing.</em>
                            </p>
                        </div>
                        <div class="ActivechecklistsContent">
                            <div class="ActivechecklistsContent1">
                                <a style="color: #337ab7;">Onboarding</a>
                            </div>
                            <div class="ActivechecklistsContent2" style="width:220px;"></div>
                            <div class="ActivechecklistsContent3">
                                <a style="color: #fff;">
                                    <i class="fa-solid fa-pen-to-square" style="color: #fafcff;"></i>
                                    Update
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="timeOff">
                    <div class="timeOffHead">
                        <h5>
                            <img src="./images/balance.png" alt="" height="24px" width="24px">
                            Time Off/Leave Balances
                        </h5>
                    </div>
                    <div class="timeOffBody">
                        <table class="leavs">
                            <thead>
                                <tr>
                                    <td>Time Off/Leave Type</td>
                                    <td>Allowance <br> (Annual)</td>
                                    <td>Balance <br> (Accrued)</td>
                                    <td>Planned <br> (In the future)</td>
                                    <td>Available <br> (To take)</td>
                                    <td>Units</td>
                                </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                        <td class="leavType">Annual Leave</td>
                                        <td>20.00</td>
                                        <td><?=$annualLeave?></td>
                                        <td>0.00</td>
                                        <td><?=$annualLeave?></td>
                                        <td>Days</td>
                                    </tr>
                                    <tr>
                                        <td class="leavType">Child born</td>
                                        <td>3.00</td>
                                        <td>0.00</td>
                                        <td>0.00</td>
                                        <td><?= $childBorn?></td>
                                        <td>Days</td>
                                    </tr>
                                    <tr>
                                        <td class="leavType">Death of Family Member</td>
                                        <td>5.00</td>
                                        <td>0.00</td>
                                        <td>0.00</td>
                                        <td><?= $deathofFamilyMember?></td>
                                        <td>Days</td>
                                       
                                    
                                    </tr>
                                    <tr>
                                        <td class="leavType">Moving Day</td>
                                        <td>1.00</td>
                                        <td>0.00</td>
                                        <td>0.00</td>
                                        <td><?= $movingDay?></td>
                                        <td>Days</td>
                                    </tr>
                                    <tr>
                                        <td class="leavType">Wedding Day</td>
                                        <td>5.00</td>
                                        <td>0.00</td>
                                        <td>0.00</td>
                                        <td><?= $weddingDay?></td>
                                        <td>Days</td>
                                    </tr>
                                    <tr>
                                        <td class="leavType">Sick Leave</td>
                                        <td>20.00</td>
                                        <td><?= $sickLeave?></td>
                                        <td>0.00</td>
                                        <td><?= $sickLeave?></td>
                                        <td>Days</td>
                                    </tr>
                                </tbody>
                        </table> 
                    </div>
                </div>
                <div class="recentLeaveRequests">
                    <div class="recentLeaveRequestsHead">
                        <h5>
                            <img src="./images/plan.png" alt="" height="24px" width="24px">
                            Recent Leave Requests
                        </h5>
                    </div>
                    <div class="recentLeaveRequestsBody">
                        <table class="recentLeave">
                            <thead>
                                <tr>
                                    <td>Description</td>
                                    <td>From</td>
                                    <td>To</td>
                                    <td>Status</td>
                                </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                        <td>Lorem ipsum</td>
                                        <td>13/09/2023</td>
                                        <td>13/09/2023</td>
                                        <td>Approved</td>
                                    </tr>
                                    <tr>
                                        <td>Lorem ipsum</td>
                                        <td>13/09/2023</td>
                                        <td>13/09/2023</td>
                                        <td>Approved</td>
                                    </tr>
                                    <tr>
                                        <td>Lorem ipsum</td>
                                        <td>13/09/2023</td>
                                        <td>13/09/2023</td>
                                        <td>Approved</td>
                                    </tr>
                                    <tr>
                                        <td>Lorem ipsum</td>
                                        <td>13/09/2023</td>
                                        <td>13/09/2023</td>
                                        <td>Approved</td>
                                    </tr>
                                    <tr>
                                        <td>Lorem ipsum</td>
                                        <td>13/09/2023</td>
                                        <td>13/09/2023</td>
                                        <td>Approved</td>
                                    </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            <div class="Calendar">
                <div class="calendarHead">
                    <h5>
                        <img src="./images/calendar.png" alt="" height="24px" width="24px">
                        Calendar
                    </h5>
                </div>
                <div class="calendarBody">
                    <div class="currentDate">
                    <h5> October 2023</h5>
                    <div>
                        <button style="font-size:12px; height:28px; margin-right: 5px; width:60px;">today</button>
                        <button><</button>
                        <button>></button>
                    </div>  
                    </div>
                    <div class="calendarTableDiv">
                    <table class="calendarTable">
                        <thead>
                            <?php foreach ($calendar->getDayLabels() as $dayLabel):?>
                            <th>
                                <?php echo $dayLabel ?>
                            </th>    
                            <?php endforeach; ?>
                        </thead>
                        <tbody>
                            <div>
                            </div>
                            <?php foreach ($calendar->getWeeks() as $week):?>
                                <tr>
                                    <?php foreach ($week as $day):?>
                                        <td <?php if(!$day['currentMonth']): ?> style="color:#e7eaec;" <?php endif; ?>>
                                            <span <?php if($calendar->isCurrentDate($day['dayNumber'])):?> style=" background-color:fcf8e3;" <?php endif; ?>>
                                            <?php echo $day['dayNumber']; ?>
                                            </span>
                                         </td>
                                    <?php endforeach; ?>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                    </div>
                    <div class="legendGuide">
                        <p>Legend:</p>
                        <div class="legendColor">
                            <div class="legend" style="background-color:#B8B790;"></div><p>Annual Leave</p>
                            <div class="legend" style="background-color:#C0A8A5;"></div><p>Child born</p>
                            <div class="legend" style="background-color:#87CFE3;"></div><p>Death of Family Member</p>
                            <div class="legend" style="background-color:#8BD2AC;"></div><p>Maternity Leave</p>
                            <div class="legend" style="background-color:#D3AB9D;"></div><p>Moving Day</p>
                            <div class="legend" style="background-color:#F3B188;"></div><p>Sick Leave</p>
                            <div class="legend" style="background-color:#CACDAF;"></div><p>Wedding Day</p>
                            <div class="legend" style="background-color:#AAE6A0;"></div><p>Work from Home</p>
                        </div>
                    </div>
                </div>
            </div>
            <div>
            </div>
            <div class="clocks">
                <div class="clock1">
                    <div class="clock1-1">
                        <a href="">Main Office</a>
                    </div>
                    <div class="clock1-2">
                        <i class="fa-regular fa-clock  fa-2xl" style="color: #3772d7;"></i>
                        <?php echo '<h2>' . $currentTime . '</h2>' ?>
                    </div>
                </div>
                <div class="clock2">
                    <div class="clock2-1">
                        <a href="">Production Office</a>
                    </div>
                    <div class="clock2-2">
                        <i class="fa-regular fa-clock fa-2xl" style="color: #3772d7;"></i>
                        <?php echo '<h2>' . $currentTime . '</h2>' ?>
                    </div>
                </div>
            </div>
            </div>
            <div class="midDiv">
            <div class="MyInfo">
                    <div class="MyInfoHead">
                        <h5>
                            <img src="./images/information.png" alt="" height="24px" width="24px">
                            My Information
                        </h5>
                    </div>
                    <div class="MyInfoBody">
                        <div class="MyInfoContent">
                            <table class="personalInfo">
                                <tbody>
                                    <tr>
                                        <td>Code</td>
                                        <th>208</th>
                                    </tr>
                                    <tr>
                                        <td>Department</td>
                                        <th>Video Research</th>
                                    </tr>
                                    <tr>
                                        <td>Location</td>
                                        <th>Main Office</th>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <th>Full Time</th>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <th>Male</th>
                                    </tr>
                                    <tr>
                                        <td>Born</td>
                                        <th>N/A</th>
                                    </tr>
                                    <tr>
                                        <td>Age</td>
                                        <th>N/A</th>
                                    </tr>
                                    <tr>
                                        <td>Employed For</td>
                                        <th>7 months 2 weeks 4 days</th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="rightDiv">

            </div>

        </div>
    </div>
</body>

</html>