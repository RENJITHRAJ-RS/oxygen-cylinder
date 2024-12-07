<%@page import="com.graph.chart"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%@page import="java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href='http://fonts.googleapis.com/css?family=Overlock:400,700,900,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!---- start-smoth-scrolling---->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #cc0f16;;
  color: white;
}
</style>
<title>Owner</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->
<div class="bgded overlay padtop" style="background-image:url('images/demo/backgrounds/01.jpg');"> 
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <header id="header" class="hoc clear">
    <div id="logo" class="fl_left"> 
      <!-- ################################################################################################ -->
      <h1><a href="index.html">owner</a></h1>
      <!-- ################################################################################################ -->
    </div>
    <nav id="mainav" class="fl_right"> 
      <!-- ################################################################################################ -->
      <ul class="clear">
        <li ><a href="ownerhome.jsp">View Product Parts Request</a></li>
         <li class="active"><a href="view_graph.jsp">View Graph</a></li>
       
        <!--  <li ><a href="omanager_details.jsp">Office Manager</a></li>
        <li ><a href="#" >Generate Payslip</a></li> -->
        <li><a href="index.html">Logout</a></li>
        <!-- <li><a href="#">Link Text</a></li> -->
      </ul>
      <!-- ################################################################################################ -->
    </nav>
  </header>
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <div id="pageintro" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <article>
      <h3 class="heading">Suspendisse potenti</h3>
      <p>Arcu mi porttitor est non felis aliquam ullamcorper sed porttitor accumsan arcu maecenas lorem elit tristique quis iaculis at euismod vel arcu donec et lorem.</p>
      <footer>
        <ul class="nospace inline pushright">
          <li><a class="btn" href="#">Integer</a></li>
          <li><a class="btn inverse" href="#">Egestas</a></li>
        </ul>
      </footer>
    </article>
    <!-- ################################################################################################ -->
  </div>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <section id="ctdetails" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="nospace clear">
      <li class="one_quarter first">
        <div class="block clear"><a href="#"><i class="fas fa-phone"></i></a> <span><strong>Give us a call:</strong> +00 (123) 456 7890</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-envelope"></i></a> <span><strong>Send us a mail:</strong> support@domain.com</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-clock"></i></a> <span><strong> Mon. - Sat.:</strong> 08.00am - 18.00pm</span></div>
      </li>
      <li class="one_quarter">
        <div class="block clear"><a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>Come visit us:</strong> Directions to <a href="#">our location</a></span></div>
      </li>
    </ul>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- <div class="wrapper row3">
  <main class="hoc container clear"> 
    main body
    ################################################################################################
    <section id="services">
      <div class="sectiontitle">
        <p class="nospace font-xs">Mauris tempor aliquam venenatis</p>
        <h6 class="heading">Curabitur at odio sed enim</h6>
      </div>
      <ul class="nospace group grid-3">
        <li class="one_third">
          <article><a href="#"><i class="fas fa-spray-can"></i></a>
            <h6 class="heading">Vehicula</h6>
            <p>Nulla cursus metus non tortor erat turpis sed semper risus nisi id nunc ut congue cursus tortor aliquam.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-user-secret"></i></a>
            <h6 class="heading">Porttitor</h6>
            <p>Vehicula nisl ac porta blandit velit risus lobortis turpis sit amet lobortis sapien dui id neque suspendisse.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-couch"></i></a>
            <h6 class="heading">Pulvinar</h6>
            <p>Vel justo mattis magna vestibulum molestie quisque sagittis in a enim in metus ultrices tristique nam semper.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-crow"></i></a>
            <h6 class="heading">Ultricies</h6>
            <p>Tincidunt metus nunc ornare mi at nibh ut ante est imperdiet dignissim eleifend sit amet lacinia tempor justo.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-dolly-flatbed"></i></a>
            <h6 class="heading">Vestibulum</h6>
            <p>Pellentesque malesuada sed et nulla sit amet nisi scelerisque consectetuer vivamus odio donec metus libero semper.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
        <li class="one_third">
          <article><a href="#"><i class="fas fa-road"></i></a>
            <h6 class="heading">Lobortis</h6>
            <p>Quis suscipit ut aliquam a metus ut interdum risus id luctus consectetuer velit neque ornare quam at ornare.</p>
            <footer><a href="#">More Details &raquo;</a></footer>
          </article>
        </li>
      </ul>
    </section>
    ################################################################################################
    / main body
    <div class="clear"></div>
  </main>
</div> -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="bgded overlay" style="background-image:url('images/demo/backgrounds/01.png');">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <p class="nospace font-xs"></p>
      <h6 class="heading">Oxygen Cylinder Details</h6>
    </div>
    <article id="points" class="group">
    <div class="contact">
		<div class="container">
			<div class="contact-top">
				
			</div>
			<div class="contact-mian">
			<%                             
        
      String trust = null;
Integer count = 0;
String privacydata=null;
ArrayList<chart> list=new ArrayList<chart>();  
String s ="";  	
       
Connection con2=null;
Statement st2= null;
ResultSet rs2= null;


   
try{
	
	
	 /* con=databasecon.getConnection(); */
	 con2=databasecon.getconnection();
	   
	st2 = con2.createStatement();
	String qry2 ="select count(cylinder_type) as count1,cylinder_type from upload_cylinder group by cylinder_type"; 
	rs2 = st2.executeQuery(qry2);
	while(rs2.next())
	{
		
		trust= rs2.getString("cylinder_type");
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP:"+trust);
		count =rs2.getInt("count1");
		System.out.println("count:"+count);
		chart as=new chart();
		as.setcylindertype(trust);
		
		as.setCount(count);
		list.add(as);
	} 
for(Integer i =0;i<list.size(); i++){
		
		chart a = list.get(i);
		s=s+"{label: \""+a.getcylindertype()+"\",y:"+a.getCount()+"},";
		
	}
 
}
catch(Exception ex){
	out.println(ex);
}
%>
        
	<script src="js/canvasjs.min.js"></script>
<script type="text/javascript">

window.onload = function () {
	
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "theme2",//theme1
		title:{
			text: "Oxygen Cylinder Details"              
		},
		animationEnabled: false,   // change to true
		data: [              
		{
			// Change type to "bar", "area", "spline", "pie",etc.
			type: "bar",
			dataPoints: [
			             <%=s%>
			]
		}
		]
	});
	chart.render();
}
</script>    
<div id="chartContainer" style="height: 300px; width: 95%;margin-left: 10px;"></div>    
 
			
	</div>
			
		</div>
	</div>
      </article>
    <!-- ################################################################################################ -->
  </section>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- <div class="wrapper row2">
  <section class="hoc container clear"> 
    ################################################################################################
    <div class="sectiontitle">
      <p class="nospace font-xs">Odio duis ut est quis nisl consequat</p>
      <h6 class="heading">Gravida donec non erat eget</h6>
    </div>
    <ul id="latest" class="nospace group sd-third">
      <li class="one_third first">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-06T08:15+00:00">06 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Elit pellentesque dapibus</a></h6>
            </figcaption>
          </figure>
          <p>Justo massa adipiscing a convallis ultricies luctus et dolor aliquam nulla aenean facilisis ullamcorper diam nunc pede nulla iaculis quis lacinia ac adipiscing.</p>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-05T08:15+00:00">05 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Quis ligula morbi quam</a></h6>
            </figcaption>
          </figure>
          <p>Semper mattis nulla cursus lorem ut gravida tempor massa massa porta libero at scelerisque et arcu nulla facilisi aenean fringilla imperdiet felis mauris.</p>
        </article>
      </li>
      <li class="one_third">
        <article>
          <figure><a class="imgover" href="#"><img src="images/demo/348x261.png" alt=""></a>
            <figcaption>
              <ul class="nospace meta clear">
                <li><i class="fas fa-user"></i> <a href="#">Admin</a></li>
                <li>
                  <time datetime="2045-04-04T08:15+00:00">04 Apr 2045</time>
                </li>
              </ul>
              <h6 class="heading"><a href="#">Hendrerit ligula eu diam</a></h6>
            </figcaption>
          </figure>
          <p>Ac lectus sed ultricies augue congue nibh donec convallis elementum leo nullam dignissim varius ante fusce pharetra sodales arcu sed rutrum ipsum a ipsum.</p>
        </article>
      </li>
    </ul>
    ################################################################################################
  </section>
</div> -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- <div class="wrapper row4">
  <footer id="footer" class="hoc clear"> 
    ################################################################################################
    <div class="one_quarter first">
      <h6 class="heading">Praesent id aliquam</h6>
      <p>Non tellus nec sapien lobortis lobortis mauris egestas massa ac cursus pellentesque leo risus convallis nulla et fringilla sapien magna sit amet magna aliquam tempus praesent sit amet neque sed lobortis nulla facilisi [<a href="#">&hellip;</a>]</p>
      <ul class="faico clear">
        <li><a class="faicon-facebook" href="#"><i class="fab fa-facebook"></i></a></li>
        <li><a class="faicon-google-plus" href="#"><i class="fab fa-google-plus-g"></i></a></li>
        <li><a class="faicon-linkedin" href="#"><i class="fab fa-linkedin"></i></a></li>
        <li><a class="faicon-twitter" href="#"><i class="fab fa-twitter"></i></a></li>
        <li><a class="faicon-vk" href="#"><i class="fab fa-vk"></i></a></li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="heading">Rutrum amet sodales</h6>
      <ul class="nospace linklist">
        <li><a href="#">Nulla tincidunt magna</a></li>
        <li><a href="#">Vel iaculis mollis mi</a></li>
        <li><a href="#">Lacus tincidunt diam ac</a></li>
        <li><a href="#">Varius purus justo pretium</a></li>
        <li><a href="#">Nunc proin tortor elit</a></li>
      </ul>
    </div>
    <div class="one_quarter">
      <h6 class="heading">At feugiat in diam</h6>
      <p class="nospace btmspace-15">In vestibulum dolor et augue fusce neque enim scelerisque at fermentum.</p>
      <form action="#" method="post">
        <fieldset>
          <legend>Newsletter:</legend>
          <input class="btmspace-15" type="text" value="" placeholder="Name">
          <input class="btmspace-15" type="text" value="" placeholder="Email">
          <button class="btn" type="submit" value="submit">Submit</button>
        </fieldset>
      </form>
    </div>
    <div class="one_quarter last">
      <h6 class="heading">Sed imperdiet pharetra</h6>
      <ul class="nospace linklist">
        <li>
          <article>
            <h6 class="nospace font-x1"><a href="#">Massa nam nulla augue</a></h6>
            <time class="font-xs block btmspace-10" datetime="2045-04-06">Friday, 6<sup>th</sup> April 2045</time>
            <p class="nospace">Faucibus nec lacinia quis ornare a eros pellentesque in orci vitae</p>
          </article>
        </li>
        <li>
          <article>
            <h6 class="nospace font-x1"><a href="#">Velit vehicula auctor</a></h6>
            <time class="font-xs block btmspace-10" datetime="2045-04-05">Thursday, 5<sup>th</sup> April 2045</time>
            <p class="nospace">Pellentesque pulvinar vestibulum bibendum blandit lectus pretium</p>
          </article>
        </li>
      </ul>
    </div>
    ################################################################################################
  </footer>
</div> -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2022 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a target="_blank" href="https://www.os-templates.com/" title="Free Website Templates">Owner</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>