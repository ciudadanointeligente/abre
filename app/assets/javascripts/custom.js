// Overrides and adds customized javascripts in this file
// Read more on documentation:
// * English: https://github.com/consul/consul/blob/master/CUSTOMIZE_EN.md#javascript
// * Spanish: https://github.com/consul/consul/blob/master/CUSTOMIZE_ES.md#javascript
//
//

function jsProblemChanged(){
  var selected = $("#select-problem option:selected").val();
  if (selected != ''){
    document.getElementById("problem-hidden").style.display = "none";
    document.getElementById("problem-display").style.display = "block";
    console.log(selected);
  } else {
    document.getElementById("problem-hidden").style.display = "block";
    document.getElementById("problem-display").style.display = "none";
    console.log(selected);
  }
}


function addDesignEvent(){
  console.log('hola');
  var $designEvent = $(this).closest('#project_design_events_attributes_0_name');
  var name = $designEvent.find("input");
  console.log(name);
  var $formGroupClone = $designEvent.clone();
  console.log($designEvent);
  console.log($formGroupClone);
  setNewNestedItem($formGroupClone, "input.starts_at");
  setNewNestedItem($formGroupClone, "input.name");
  $formGroupClone.find('input').val('');
  $formGroupClone.insertAfter($designEvent);
}
