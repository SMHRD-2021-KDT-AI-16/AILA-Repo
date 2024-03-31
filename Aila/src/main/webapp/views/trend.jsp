<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>트렌드</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../resource/assets/vendors/feather/feather.css">
    <link rel="stylesheet" href="../resource/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../resource/assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="../resource/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../resource/assets/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../resource/assets/images/favicon.png" />
    <style>
	   	.image-with-space {
		margin-right: 13px; /* 그림의 오른쪽에 20px의 공백 추가 */
		}
		.wrapper {
			cursor: pointer;
		}
		.h{
	       	font-size: 16px; /* 기본 텍스트 크기 */
	        transition: font-size 0.3s; /* 변경 시 부드럽게 전환 */
	      }
	    .h:hover{   
	        text-decoration : underline;
	        text-decoration-color : yellowgreen;
	       	text-decoration-thickness: 3px;
	        font-size: 20px;
	      }
		#test2 {
			display: none;
			/* transition: width 2s; */
			width: 50%;
		}
		
		/* .col-md-6 {
			transition: width 1s;
		}  */

   	</style>

</head>

<body>
    <div>
        <!-- partial:../../partials/_navbar.html -->
        <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                <div class="me-3">
                    <button class="navbar-toggler navbar-toggler align-self-center" type="button"
                        data-bs-toggle="minimize">
                        <span class="icon-menu"></span>
                    </button>
                </div>
                <div>
                    <a class="navbar-brand brand-logo" href="Trend.do">
                        <img src="../resource/assets/images/logo_h.png" alt="logo" />
                    </a>
                    <a class="navbar-brand brand-logo-mini" href="Trend.do">
                        <img src="../resource/assets/images/logo_mini.png" alt="logo" />
                    </a>
                </div>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-top border-bottom">
                <ul class="navbar-nav">
                    <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                        <h1 class="welcome-text"><span class="text-black fw-bold">트렌드</span></h1>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto">

                    <li class="nav-item d-none d-lg-block">
                        <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                            <span class="input-group-addon input-group-prepend border-right">
                                <span class="icon-calendar input-group-text calendar-icon"></span>
                            </span>
                            <input type="text" class="form-control">
                        </div>
                    </li>

                    <li class="nav-item dropdown d-none d-lg-block user-dropdown">
                        <a class="nav-link" href="Logout.do">
                            <i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>로그아웃
                            </a>
                    </li>
                </ul>

            </div>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_settings-panel.html -->
            <div class="theme-setting-wrapper">
                <div id="settings-trigger"><i class="ti-settings"></i></div>
                <div id="theme-settings" class="settings-panel">
                    <i class="settings-close ti-close"></i>
                    <p class="settings-heading">SIDEBAR SKINS</p>
                    <div class="sidebar-bg-options selected" id="sidebar-light-theme">
                        <div class="img-ss rounded-circle bg-light border me-3"></div>Light
                    </div>
                    <div class="sidebar-bg-options" id="sidebar-dark-theme">
                        <div class="img-ss rounded-circle bg-dark border me-3"></div>Dark
                    </div>
                    <p class="settings-heading mt-2">HEADER SKINS</p>
                    <div class="color-tiles mx-0 px-4">
                        <div class="tiles success"></div>
                        <div class="tiles warning"></div>
                        <div class="tiles danger"></div>
                        <div class="tiles info"></div>
                        <div class="tiles dark"></div>
                        <div class="tiles default"></div>
                    </div>
                </div>
            </div>

            <!-- partial -->
            <!-- partial:../../partials/_sidebar.html -->
             <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="Trend.do">
                            <i class="ti-stats-up menu-icon"></i>
                            <span class="menu-title">트렌드</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="Goreview_products.do">
                            <i class="ti-bar-chart-alt menu-icon"></i>
                            <span class="menu-title">리뷰 분석</span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="News.do">
                            <i class="mdi mdi-card-text-outline menu-icon"></i>
                            <span class="menu-title">뉴스</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
			<div class="main-panel">
			    <div class="content-wrapper">
			        <div class="row">
			            <div class="col-sm-12" style="position: relative;">
			                <div class="home-tab">
		
			                </div>
			                <div class="row flex-grow" style="position: absolute; width: 100%;">
			                    <div class="col-md-6 col-lg-3 grid-margin stretch-card" style="width: 50%;" id="search10">
			                        <div class="card">
			                            <div class="card-body card-rounded">
			                                <div class="d-flex align-items-center justify-content-between mb-3">
			                                    <h4 class="card-title card-title-dash">인기 검색어 (일간)</h4>
			                                </div>  
			                                <c:forEach var="t" items="${top10}">
			                                <div class="list align-items-center border-bottom py-2">
			                                    <div class="wrapper w-100">
			                                        <p class="mb-2 font-weight-medium">
			                                            <div class ="h" onclick="test('${t.search_word}')"> ${t.search_rank}위 ${t.search_word}</div>
			                                        </p>
			                                    </div>
			                                </div>
			                                </c:forEach>
			                            </div>
			                        </div>
			                    </div>
			                    <div id="test2" class="col-md-6 col-lg-3 grid-margin stretch-card">
			                        <div class="card"> 
			                        	<div class="card-body card-rounded" >
			                                <div class="d-flex align-items-center justify-content-between mb-3">
			                                    <h4 class="card-title card-title-dash">연관검색량(일간)</h4>
			                                </div>  
			 								<div class="list align-items-center border-bottom py-2">
			 									<div class="chart-wrap" style= "height: 550px">
					                             	<canvas id="SearchCntChart"></canvas>
					                            </div>
			                        		</div>
			                            </div>
			                        </div>
			                    </div>
			                   <div class="col-md-6 col-lg-3 grid-margin stretch-card test" style="width: 50%;" id="weather">
			                        <div class="card">
			                            <div class="card-body card-rounded" style="height: 100%; width: 100%">
			                                <div class="d-flex align-items-center justify-content-between mb-3">
			                                    <h4 class="card-title card-title-dash">내일 날씨</h4>
			                                </div>
			                                <div style="background-color: dodgerblue; width: 100%; height: 90%; border-radius: 15px;">
			                                    <iframe src="../resource/partials/weathermap.html" width="100%" height="100%" frameborder='0' scrolling="no"></iframe>
			                                </div>
			                            </div>
			                        </div>
			                   </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
                        </div>
                        <!-- content-wrapper ends -->
                        <!-- partial:../../partials/_footer.html -->
                        <footer class="footer">
                            <div class="d-sm-flex justify-content-center justify-content-sm-between">
                                <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a
                                        href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin
                                        template</a> from BootstrapDash.</span>
                                <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2021.
                                    All rights reserved.</span>
                            </div>
                        </footer>
                        <!-- partial -->
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->
            <!-- plugins:js -->
            <script src="../resource/assets/vendors/js/vendor.bundle.base.js"></script>
            <script src="../resource/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
            
            <!-- endinject -->
            <!-- Plugin js for this page -->
            <script src="../resource/assets/vendors/chart.js/Chart.min.js"></script>
            <script src="../resource/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
            <!-- End plugin js for this page -->
            <!-- inject:js -->
            <script src="../resource/assets/js/off-canvas.js"></script>
            <script src="../resource/assets/js/hoverable-collapse.js"></script>
            <script src="../resource/assets/js/template.js"></script>
            <script src="../resource/assets/js/settings.js"></script>
            <script src="../resource/assets/js/todolist.js"></script>
            <!-- endinject -->
			<script type="text/javascript">     
			    var scb = document.getElementById('SearchCntChart').getContext('2d');
				var test2 = document.getElementById('test2')
			    function test(search_word) {
			        $.ajax({
			            url: "Trend.do",
			            type: "GET",
			            data: {
			                "search_word" : search_word,
			                ajax: 'true'
			            },
			            dataType: "json",
			            success: function(data) {
			            	
			            	$('#search10').css('width', '15%');
			            	$('#weather').css('width', '35%');
			            	$('#test2').fadeIn(1000); // 1초 동안 천천히 나타나도록 설정


			                var existingChart = Chart.getChart("SearchCntChart");
			                test2.style.display = 'block';
			                if (existingChart) {
			                    existingChart.destroy();
			                }
			                let a = [];
			                let b = [];
			                for(let i = 0 ; i < data.length; i++) {
			                    a.push(data[i].rel_search);
			                    b.push(data[i].search_cnt);
			                }
			
			                let searchCntBar = new Chart(scb, {
			                    type: 'bar',
			                    data: {
			                        labels: a, 
			                        datasets: [{
			                            data: b,
 										backgroundColor:[
 										    "#1f77b4",
 										    "#d62728",
 										    "#2ca02c",
 										    "#9467bd",
 										    "#ff7f0e", 
 										    "#ffdb00", 
 										    "#e377c2", 
 										    "#17becf",  
 										    "#7f7f7f", 
 										    "#8c564b" 
 										]
			                        }]
			                    },
			                    options: {
			                    	maintainAspectRatio: false,
			                    	responsive: true,
			                        scales: {},
			                        plugins: {
			                            legend: {
			                                display: false
			                            }
			                        },
			                        indexAxis: 'y'
			                    }
			                });
			            },
			            error: function(xhr, status, error) {
			                console.error("데이터를 불러오는 중 오류가 발생했습니다:", status, error);
			            }
			        }); 
			    }
			    
			</script>
</body>

</html>
