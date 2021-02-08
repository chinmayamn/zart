// JavaScript Document
function insertRemoveP(reMove) {
	var targetEl = document.getElementById('dynamictest');
	var scrollDiv = document.getElementById('test1');
	if (targetEl == null || scrollDiv == null) return;

	if (typeof(targetEl.parS) == 'undefined') targetEl.parS = new Array();
	if (!reMove) {
		targetEl.parS[targetEl.parS.length] = document.createElement('p');
		targetEl.parS[targetEl.parS.length-1].appendChild(document.createTextNode('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque ultrices facilisis risus. Aenean sollicitudin imperdiet justo.'));
		targetEl.appendChild(targetEl.parS[targetEl.parS.length-1]);
		} else if (targetEl.parS.length > 0) {
		targetEl.parS[targetEl.parS.length-1].parentNode.removeChild(targetEl.parS[targetEl.parS.length-1]);
		targetEl.parS.length = targetEl.parS.length - 1;
		}

	//Following is the method to tell fleXcrolled div to update itself
	if(scrollDiv.fleXcroll) scrollDiv.fleXcroll.updateScrollBars();
	//Notice that it is best to check if fleXcroll exists on the object first, otherwise your javascript will throw an
	//error on browsers that are blocked.

}

function makeWideNarrow() {
	var targetEl = document.getElementById('dynamictest');
	var scrollDiv = document.getElementById('test1');
	if (targetEl == null || scrollDiv == null) return;
	if (targetEl.parentNode.className=='dynamic') targetEl.parentNode.className = 'fixedsize';
	else targetEl.parentNode.className='dynamic';
	//Following is the method to tell fleXcrolled div to update itself
	if(scrollDiv.fleXcroll) scrollDiv.fleXcroll.updateScrollBars();
}

function cleanTestDiv() {
	var targetEl = document.getElementById('dynamictest');
	var scrollDiv = document.getElementById('test1');
	if (targetEl != null) targetEl.innerHTML = '';
	if (typeof(targetEl.parS) != 'undefined') targetEl.parS = new Array();
	targetEl.parentNode.className = 'dynamic';
	//Following is the method to tell fleXcrolled div to update itself
	if(scrollDiv.fleXcroll) scrollDiv.fleXcroll.updateScrollBars();
}

//a basic example external module to control scroll from outside
//NOT required for fleXcroll to run, and user do NOT need to
//know what this is for standard operation.
function fleXcrollTo(id,x,y,relative) {
	var scrollDiv = document.getElementById(id);
	//Return if the target is null
	if (scrollDiv == null) return;
	//Do the scroll by using custom method attached by fleXcroll
	//but first check if the method exists.
	if(scrollDiv.fleXcroll) scrollDiv.fleXcroll.setScrollPos(x,y,relative);

}

//]]>