 <%@page contentType="text/html" import="java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
    <head>
        <title>Daily production and dispatch details</title>
         
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <link href="https://fonts.googleapis.com/css?family=Crete+Round&display=swap" rel="stylesheet">
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
            String currentDate = sdf.format(new Date());
          %>
    </head>
    <body>
        <h2 class="heading">DAILY PRODUCTION DETAILS </h2> 
        <h2 id="dep" class="heading"></h2>
        <div class="container">
        <div class='date float-right font-weight-bold text-info bg-warning'><%= currentDate %> </div>
        </div>  
         <div class='container'>
          <div class="row">
          <form action="ritika"  method="post" id='ritForm'>       
            
        <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>PRODUCTION</th>
               <th>SHIFT I</th>
                <th>SHIFT II</th>
                <th>SHIFT III</th>
                <th>ON-DATE</th>
                <th>CUM.</th>
            </tr>
        </thead>
        <tbody>
            <div class="label label-warning"><h3>Production</h3></div>
            <tr>
                <td>Feed</td>
                <td><input type="number" id="feed_I" name="Feed-I" placeholder='Feed - I' value="" pattern="^\d*$"  title="Feed - I" required onblur="calculateOnDateFeed(this)"></td>
                <td><input type="number" id="feed_II"  name="Feed-II" placeholder='Feed-  II' value="" pattern="^\d*$"  title="Feed - II" required onblur="calculateOnDateFeed(this)"></td>
                <td><input type="number" id="feed_III" name="Feed-II" placeholder='Feed -  III' value="" pattern="^\d*$"  title="Feed -  III" required onblur="calculateOnDateFeed(this)"></td>
                <td> <input type="number" id="feed_onDate" name="Feed-onDate" placeholder='Feed - On-Date'  default value="0"  title="Feed - ON-DATE" disabled  > </td>
                <td> <input type="number" id="feed_cumm" name="Feed-cum" placeholder='Feed - CUM' default value="0"  title="Feed - CUM" disabled  > </td>
            </tr>
        </tbody>     
    </table>
<div>
    <div class="label label-warning"><h3>Stoppages</h3></div>
<select id="stoppage" multiple>            
    <option>NO ORE</option>
    <option>PSP FULL</option>
    <option>BOULDER JAM</option>
    <option>CHUTE JAM</option>
    <option>NO POWER</option>
    <option>MECH. B/D</option>
    <option>ELEC. B/D</option>
    <option>OTHERS</option>           
</select>   
<button type='button' class='btn btn-primary' id='btnAddStoppages'><i class="fa fa-plus"></i>  Add Stoppages</button>      
 <div>
     <table class="table hide" id='tblStoppages'>
        <thead class="thead-dark">
            <tr>
                <th>STOPPAGES</th>
                <th>SHIFT I</th>
                <th>SHIFT II</th>
                <th>SHIFT III</th>
                <th>ON-DATE</th>
                <th>CUM.</th>
                <th></th>
            </tr>
        </thead>
        <tbody>            
            <tr class='hide'>
                <td>No Stoppage</td> 
                <td><input type="number" step=".01" max="8" name="Stop-I" placeholder='Stoppage -  I' shift='I'  title="Stoppage -  I"  onblur="calculateOnDateStoppage(this); return calTotalUtil(this); " ></td>
                <td><input type="number" step=".01" max="8"  name="Stop-II" placeholder='Stoppage -  II'  shift='II' title="Stoppage -  II"  onblur="calculateOnDateStoppage(this); return calTotalUtil(this)"  ></td>
                <td><input type="number" step=".01" max="8"  name="Stop-III" placeholder='Stoppage -  III' shift='III' title="Stoppage -  III"  onblur="calculateOnDateStoppage(this); return calTotalUtil(this)" ></td>
                <td><input type="number" step=".01"  name="Stop-onDate" placeholder='Stoppage - ON-DATE' default value="0" title="Stoppage - ON-DATE" disabled ></td>
                <td><input type="number" step=".01" name="Stop-cum" placeholder='Stoppage - CUM' default value="0" title="Stoppage - CUM" disabled > </td>
                <td><button type='button' class='btn btn-danger btn-sm' name='btnRemoveStoppages' onclick="removeStoppage(this)"><i class="fa fa-trash"></i>  Delete</button></td>
            </tr>
      </tbody>
     </table>
 </div>
</div>
              
 <div>
<div class="label label-warning"><h3>Breakdowns</h3></div>
<select id="breakdown" multiple>            
    <option>NO ORE</option>
    <option>PSP FULL</option>
    <option>BOULDER JAM</option>
    <option>CHUTE JAM</option>
    <option>NO POWER</option>
    <option>MECH. B/D</option>
    <option>ELEC. B/D</option>
    <option>OTHERS</option>           
</select>   
<button type='button' class='btn btn-primary' id='btnAddBreakdowns'><i class="fa fa-plus"></i>  Add Breakdown</button>      
 <div>
     <table class="table hide" id='tblBreakdown'>
        <thead class="thead-dark">
            <tr>
                <th>BREAKDOWNS</th>
                <th>SHIFT I</th>
                <th>SHIFT II</th>
                <th>SHIFT III</th>
                <th>ON-DATE</th>
                <th>CUM.</th>
                <th></th>
            </tr>
        </thead>
        <tbody>            
            <tr class='hide'>
                <td>No Breakdown</td> 
                <td><input type="number" step=".01" max="8" name="Breakdown-I" placeholder='Breakdown -  I' shift='I'  title="Breakdown-  I"  onblur="calculateOnDateBreakdown(this); return calTotalUtil(this); " ></td>
                <td><input type="number" step=".01" max="8"  name="Breakdown-II" placeholder='Breakdown -  II'  shift='II' title="Breakdown -  II"  onblur="calculateOnDateBreakdown(this); return calTotalUtil(this)"  ></td>
                <td><input type="number" step=".01" max="8"  name="Breakdown-III" placeholder='Breakdown -  III' shift='III' title="Breakdown -  III"  onblur="calculateOnDateBreakdown(this); return calTotalUtil(this)" ></td>
                <td><input type="number" step=".01"  name="Breakdown-onDate" placeholder='Breakdown - ON-DATE' default value="0" title="Breakdown - ON-DATE" disabled ></td>
                <td><input type="number" step=".01" name="Breakdown-cum" placeholder='Breakdown - CUM' default value="0" title="Breakdown - CUM" disabled > </td>
                <td><button type='button' class='btn btn-danger btn-sm' name='btnBreakdowns' onclick="removeBreakdown(this)"><i class="fa fa-trash"></i>  Delete</button></td>
            </tr>
      </tbody>
     </table>
 </div>
</div>             
        <table class="table">
        <thead class="thead-dark">
            <tr>
                <th>PRODUCTION</th>
               <th>SHIFT I</th>
                <th>SHIFT II</th>
                <th>SHIFT III</th>
               <th>ON-DATE</th>
                <th>CUM.</th>
                
            </tr>
        </thead>
        <tbody>
            
            <div class="label label-warning"><h3>Utilization (Hrs.)</h3></div>
            <tr>
                     <td>UTL.<br>
                         6550/6650-CR <br>
                     </td>
                <td><input type="number" step=".01" id="UTL_I" name="UTL-I" placeholder='UTL. -  I'   value="0"  pattern="^\d*(\.\d{0,2})?$"  title="UTL. -  I"   disabled onblur="calculateSum(this)"></td>
                <td><input type="number" step=".01" id="UTL_II" name="UTL-II" placeholder='UTL. -  II'  value="0"   pattern="^\d*(\.\d{0,2})?$" title="UTL. -  II"   disabled onblur="calculateSum(this)"></td>
                <td><input type="number" step=".01" id="UTL_III" name="UTL-III" placeholder='UTL. -  III'  value="0"  pattern="^\d*(\.\d{0,2})?$"  title="UTL. -  III"   disabled ></td>
                 <td><input type="number" step=".01" id="UTL_onDate" name="UTL-onDate" placeholder='UTL. - ON-DATE'  value="0"  title="UTL. - ON-DATE" disabled ></td>
                <td><input type="number" step=".01" id="UTL_cumm" name="UTL-cum" placeholder='UTL. - CUM'  value="0" title="UTL. - CUM" disabled > </td>
            </tr>
      </tbody>
       </table>        
    
    <br>
        
    <article>
            
           <div class="label label-warning"><h3>Scheduled Hr.</h3></div>
            <mark> SHIFT I - 8hr. / </mark>   
             <mark> SHIFT II - 8hr. / </mark>  
              <mark> SHIFT III - 8hr. </mark>  
    </article>     
     <center>
       <button type="submit" class='btn btn-success btn-sm mr-3'>SUBMIT</button> 
       <a  href="productionmenu.html">Go Back</a>
     </center>             
   </form>

         </div>
         </div>
        
           
      
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>

    <script type="text/javascript">
        const SCHEDULED_HR =8;
        
        //update the ondate feed value based on change in shift's feed
        function calculateOnDateFeed(field) {   
                let currentRow = $(field).closest("tr");
                let first =  parseInt($("input[id$='_I']",currentRow).val()) ||0 ;
                let second =  parseInt($("input[id$='_II']",currentRow).val()) ||0;
                let third =  parseInt($("input[id$='_III']",currentRow).val())||0;              
                let calOnDate = first + second + third;
                $("input[id$='_onDate']",currentRow).val(calOnDate);
         } 
         
        //update the ondate stoppage value based on change in shift's stoppage
        function calculateOnDateStoppage(field) {   
            let currentRow = $(field).closest("tr");
            let first =  parseFloat($("input[name$='-I']",currentRow).val()) ||0 ;
            let second =  parseFloat($("input[name$='-II']",currentRow).val()) ||0;
            let third =  parseFloat($("input[name$='-III']",currentRow).val())||0;              
            let calOnDate = first + second + third;
            $("input[name$='-onDate']",currentRow).val(calOnDate.toFixed(2));
         } 
          
           //update the ondate breakdown value based on change in shift's stoppage
        function calculateOnDateBreakdown(field) {   
            let currentRow = $(field).closest("tr");
            let first =  parseFloat($("input[name$='-I']",currentRow).val()) ||0 ;
            let second =  parseFloat($("input[name$='-II']",currentRow).val()) ||0;
            let third =  parseFloat($("input[name$='-III']",currentRow).val())||0;              
            let calOnDate = first + second + third;
            $("input[name$='-onDate']",currentRow).val(calOnDate.toFixed(2));
         }  
          
          //calculates total of the stoppages for the shift
            function calTotalStoppageAndBreakdown(curObj) { 
                let total=0;
                let currentName = $(curObj).prop("name");
                let stoppageFields = $(`input[name=${currentName}]`).not(":first");
                stoppageFields.each((index,stoppage) => {
                 //console.log(stoppage);
                  total += parseFloat(stoppage.value)||0;
                 });
                 
                if(total > SCHEDULED_HR ){
                 alert(`Verify that the total stoppages should not be more than ${SCHEDULED_HR} hrs`);  
                 $(curObj).val('');
                 return false;
                }
                return total.toFixed(2);
               }
            
            //updates the utilisation hour for the shfit
            function calTotalUtil(curObj) {
                let utilHr = (SCHEDULED_HR - calTotalStoppageAndBreakdown(curObj)).toFixed(2);
                let currentShift = $(curObj).attr("shift");
                
                document.getElementById(`UTL_${currentShift}`).value = utilHr;
                
                let utilI = document.querySelector("#UTL_I").value;
                let utilII = document.querySelector("#UTL_II").value;
                let utilIII = document.querySelector("#UTL_III").value;
                let utilOnDate = document.querySelector("#UTL_onDate");
                
                let totalUtil = parseFloat(utilI) +parseFloat(utilII)+parseFloat(utilIII);

                utilOnDate.value = totalUtil.toFixed(2);
           }     
   
    
        function checkExist(compareText, tableId) {
         let isExist = false;
         $(`${tableId} tbody tr`).find("td:first").each( (index,column) => { 
            let a = $(column).html();
            if(a === compareText) { 
              isExist = true;
            }
        });
        return isExist;
        }


        $("#btnAddStoppages").on("click", function () {
            let selected = $("#stoppage").val();  
            if(!selected ) {
                alert("select atleast one stoppage reason to be added");
                return;
            }
            for(let i=0;i<selected.length;i++){ 
                if(!checkExist(selected[i]),"tblStoppages" ) {       
                    let row = $("#tblStoppages tbody tr:first").clone(false);
                    $(row).removeClass('hide');
                    $("#tblStoppages").removeClass('hide');
                    $(row).find('td')[0].innerText = selected[i];
                    $("#tblStoppages tbody").append(row);
                   }     
                }
            });  
            
        $("#btnAddBreakdowns").on("click", function () {
            let selected = $("#breakdown").val();  
            if(!selected ) {
                alert("select atleast one breakdown reason to be added");
                return;
            }
            for(let i=0;i<selected.length;i++){ 
                if(!checkExist(selected[i], "tblBreakdown" )) {       
                    let row = $("#tblBreakdown tbody tr:first").clone(false);
                    $(row).removeClass('hide');
                    $("#tblBreakdown").removeClass('hide');
                    $(row).find('td')[0].innerText = selected[i];
                    $("#tblBreakdown tbody").append(row);
                   }     
                }
            });     
   
        
        function removeStoppage(btn) {
            let row = $(btn).closest("tr")
            let stoppageType = $(row).find("td:first").html();
            $(btn).closest("tr",row).remove();
            $('#stoppage').multiselect('deselect', [stoppageType]); 
            const countRows = $('#tblStoppages').find("tr").length;
            if(countRows <3) { //one header row , second hidden row
                $("#tblStoppages").addClass('hide');                
            }
            let firstShiftObj = $(row).find("td:nth-child(2) > input",row) ;
            let secondShiftObj = $(row).find("td:nth-child(3)> input",row) ;
            let thirdShiftObj = $(row).find("td:nth-child(4)> input",row) ;
            calTotalUtil(firstShiftObj);
            calTotalUtil(secondShiftObj);
            calTotalUtil(thirdShiftObj);
        }    
        
        
            function removeBreakdown(btn) {
            let row = $(btn).closest("tr")
            let breakdownType = $(row).find("td:first").html();
            $(btn).closest("tr",row).remove();
            $('#breakdown').multiselect('deselect', [breakdownType]); 
            const countRows = $('#tblBreakdown').find("tr").length;
            if(countRows <3) { //one header row , second hidden row
                $("#tblBreakdown").addClass('hide');                
            }
            let firstShiftObj = $(row).find("td:nth-child(2) > input",row) ;
            let secondShiftObj = $(row).find("td:nth-child(3)> input",row) ;
            let thirdShiftObj = $(row).find("td:nth-child(4)> input",row) ;
            calTotalUtil(firstShiftObj);
            calTotalUtil(secondShiftObj);
            calTotalUtil(thirdShiftObj);
        }   
        
        
        $(function() {            
            let dep = "Deposit- "+window.location.search.split("=")[1];                        
            $("#dep").text(dep);    
            
            $('#stoppage').multiselect({
                includeSelectAllOption: true,
                nonSelectedText: 'No Stoppages',
                numberDisplayed: 1,        
                enableCaseInsensitiveFiltering: true,        
            }); 
            
            $('#breakdown').multiselect({
                includeSelectAllOption: true,
                nonSelectedText: 'No Breakdown',
                numberDisplayed: 1,        
                enableCaseInsensitiveFiltering: true,        
            });
        });

        </script>  


</body>
    
</html>
