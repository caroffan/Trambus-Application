<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>map</title>
        <link rel="stylesheet" href="css/style.css"/>
        
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin="" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.3.0/dist/MarkerCluster.Default.css" />

        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>
        <script src="https://unpkg.com/leaflet.markercluster@1.3.0/dist/leaflet.markercluster.js"></script>
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link href="https://fonts.googleapis.com/css?family=Pinyon+Script|Source+Sans+Pro:300,400,600,700" rel="stylesheet">
      </head>
      <body>   
        <header class="topbar">
            <div class="logo">
                <a href="/Pgl/">Accueil</a>
            </div>
            <nav class="menu" onclick="changeView()">
                
                <a href="/Pgl/map">Carte</a>
                
                <c:if test="${ empty sessionScope.id}">
                <a href="/Pgl/connexion" class="menu-item">Connexion</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/contact" class="menu-item">Contact</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/deconnexion" class="menu-item">Deconnexion</a>
                </c:if>
                <c:if test="${ !empty sessionScope.id}">
                <a href="/Pgl/compte" class="menu-item">Compte</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                <a href="/Pgl/admin" class="menu-item">Admin</a>
                </c:if>
                <c:if test="${sessionScope.statut=='admin' }">
                <a href="/Pgl/notif" class="menu-item">Notification</a>
                </c:if>
            </nav>
            <div class="boutton_notation" onclick="changeView()">
				<div class="notation">Avis et notation</div>
			</div>
        </header>
		<div class="bandeau_notation" style="overflow:scroll">
			<fieldset>
				<legend>Veuillez saisir votre évalutaion</legend>
					<div id="avis_note">
						<form method="post" action="map">
							<label for="ligne">Choix de la ligne</label>	
								<select  name="eval_ligne" id="eval_ligne" onclick="this.form.texte.value=this.options[this.selectedIndex].text;">
									<option value="A">Ligne A</option>
									<option value="1">Ligne 1</option>
									<option value="2">Ligne 2</option>
									<option value="3">Ligne 3</option>
									<option value="4">Ligne 4</option>
									<option value="5">Ligne 5</option>
									<option value="6">Ligne 6</option>
									<option value="7">Ligne 7</option>
									<option value="8">Ligne 8</option>
									<option value="9">Ligne 9</option>
									<option value="10">Ligne 10</option>
									<option value="11">Ligne 11</option>
									<option value="12">Ligne 12</option>
									<option value="13">Ligne 13</option>
									<option value="14">Ligne 14</option>
									<option value="15">Ligne 15</option>
									<option value="30">Ligne 30</option>
									<option value="31">Ligne 31</option>
									<option value="32">Ligne 32</option>
									<option value="33">Ligne 33</option>
									<option value="34">Ligne 34</option>
									<option value="35">Ligne 35</option>
									<option value="36">Ligne 36</option>
									<option value="37">Ligne 37</option>
									<option value="38">Ligne 38</option>
									<option value="39">Ligne 39</option>
									<option value="40">Ligne 40</option>
									<option value="41">Ligne 41</option>
									<option value="42">Ligne 42</option>
									<option value="43">Ligne 43</option>
									<option value="1s">Ligne 1s</option>
									<option value="2s">Ligne 2s</option>
									<option value="3s">Ligne 3s</option>
									<option value="4s">Ligne 4s</option>
									<option value="1d">Ligne 1d</option>
									<option value="3d">Ligne 3d</option>
									<option value="4d">Ligne 4d</option>
									<option value="
									12d">Ligne 12d</option>
								</select></br>
							<div>
							<label for="note">Notation du transport → </label>
								<select  name="eval_note" id="eval_note">
									<option value='0' selected>--Choisissez une note !--</option>
									<option value='0.5'>0.5</option>
									<option value='1'>1</option>
									<option value='1.5'>1.5</option>
									<option value='2'>2</option>
									<option value='2.5'>2.5</option>
									<option value='3'>3</option>
									<option value='3.5'>3.5</option>
									<option value='4'>4</option>
									<option value='4.5'>4.5</option>
									<option value='5'>5</option>
								</select>
							</p>
						</div>
						<div>
							<p>
								<label for="comm">Commentaires : </label>
								<input type='text' name="eval_comment" id="eval_comment"/>
							</p>
						</div>			
						<div>
							<p>
								<label for="alerte">▲ Alertes : </label>
								<input type='text' name="eval_alerte" id="eval_alerte"/>
							</p>
						</div>     
						<div>
							<p>
								<input type="submit" name='button_avis' value='Envoyer'>
							</p>
						</div>
					</form>
				</div>
			</fieldset>
					<div>
			<p>
				<c:if test="${ !empty form.avis }"><div role="alert"><p><c:out value="${ form.avis }" /></p></div></c:if>
			</p>
		</div>
		<fieldset>		
			<legend>Modification</legend>	
				<div id="modif_note">
						<form method="post" action="map">
							<label for="ligne">Choix de la ligne</label>	
								<select name="eval_ligne" id="eval_ligne" onclick="this.form.texte.value=this.options[this.selectedIndex].text;">
									<option value="A">Ligne A</option>
									<option value="1">Ligne 1</option>
									<option value="2">Ligne 2</option>
									<option value="3">Ligne 3</option>
									<option value="4">Ligne 4</option>
									<option value="5">Ligne 5</option>
									<option value="6">Ligne 6</option>
									<option value="7">Ligne 7</option>
									<option value="8">Ligne 8</option>
									<option value="9">Ligne 9</option>
									<option value="10">Ligne 10</option>
									<option value="11">Ligne 11</option>
									<option value="12">Ligne 12</option>
									<option value="13">Ligne 13</option>
									<option value="14">Ligne 14</option>
									<option value="15">Ligne 15</option>
									<option value="30">Ligne 30</option>
									<option value="31">Ligne 31</option>
									<option value="32">Ligne 32</option>
									<option value="33">Ligne 33</option>
									<option value="34">Ligne 34</option>
									<option value="35">Ligne 35</option>
									<option value="36">Ligne 36</option>
									<option value="37">Ligne 37</option>
									<option value="38">Ligne 38</option>
									<option value="39">Ligne 39</option>
									<option value="40">Ligne 40</option>
									<option value="41">Ligne 41</option>
									<option value="42">Ligne 42</option>
									<option value="43">Ligne 43</option>
									<option value="1s">Ligne 1s</option>
									<option value="2s">Ligne 2s</option>
									<option value="3s">Ligne 3s</option>
									<option value="4s">Ligne 4s</option>
									<option value="1d">Ligne 1d</option>
									<option value="3d">Ligne 3d</option>
									<option value="4d">Ligne 4d</option>
									<option value="12d">Ligne 12d</option>
								</select>
							<div>
							<label for="note">Notation du transport → </label>
								<select name="eval_note" id="eval_note">
									<option value='0' selected>--Choisissez une note !--</option>
									<option value='0.5'>0.5</option>
									<option value='1'>1</option>
									<option value='1.5'>1.5</option>
									<option value='2'>2</option>
									<option value='2.5'>2.5</option>
									<option value='3'>3</option>
									<option value='3.5'>3.5</option>
									<option value='4'>4</option>
									<option value='4.5'>4.5</option>
									<option value='5'>5</option>
								</select>
						</div>    
						<div>
							<p>
								<input type="submit" name='button_modif' value='Modification'>
							</p>
						</div>
					</form>
				</div>
			
		</fieldset>
		</div>
    <div id="mapid"></div>
	<script src="js/app2.js"></script>
    </body>
</html>
<script>
var onClick = 0;
var change = document.getElementById('mapid');
 function changeView(){ //bandeau de notation, commentaires et alerte a droite
	onClick ++;
	if (onClick%2 == 1){
		change.style.cssText = 'width:100%';
	}else{
		change.style.cssText = 'width:85%';
	}
} 
</script>
