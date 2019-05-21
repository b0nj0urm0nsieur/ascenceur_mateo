PROGRAM proj_2;

TYPE
	int = integer; //simplification

	card = RECORD //type carte défini par son nombre et sa couleur
		number : int;
		color : int;
		end;

	ptr_card = ^card; //pointeur élément carte

	ptr_noeud = ^noeud; //pointeur noeud
	
	noeud = RECORD
		item : card;
		next : ptr_noeud;
		end;

	tab_card = array[1..52]of card;//tableau de cartes 

	joueur = RECORD//définit un joueur
		nom : string;
		main : tab_card;
		score : int;
		end;

		
		
VAR
	kartest1,kartest2,kartest3 : card;
	GLOBAL_cards_tab: tab_card;// à considérer comme une CONSTANTE qui contient les références de nos cartes
	node1, node2, node3 : noeud;
	premier_ptr_noeud : ptr_noeud;
	
{----------------------------FUNCTIONS x PROCEDURES-----------------------} 

//INITILISTE : Fonction init liste

FUNCTION initListe () : ptr_card;

BEGIN
	initListe := Nil;
END;

// CREERNOEUD : Fonction qui va créer un noeud à partir d'une carte donnée ( carte plus pointeur NIL )

FUNCTION creerNoeud (carte : card) : noeud;
	
BEGIN
	creerNoeud.item.number := carte.number;
	creerNoeud.item.color := carte.color;
	creerNoeud.next := Nil;
END;

// INSERETETE : Fonction qui insert un noeud (carte plus pointeur noeud) en tete de liste (modifiee)

function insereTete(kartest1 : card ; node : noeud):noeud;	
BEGIN
	{node1.item.color := 
	node1.item.number := kartest1.number;
	new(ptr);
	node1.next:= @node;} 
	insereTete.item.color := kartest1.color;
	insereTete.item.number := kartest1.number;
	insereTete.next := @node;
	//writeln(insereTete.next^.item.number);
END;

// AFFICHELISTE : 


PROCEDURE afficheListe(ptnoeud : ptr_noeud);

BEGIN
	write('Liste : ');
	WHILE (ptnoeud <> Nil) DO
	BEGIN
		write('La couleur est ', ptnoeud^.item.color);
		write('Le numéro est ', ptnoeud^.item.number);
		writeln('');
		ptnoeud := ptnoeud^.next;
	END;
	writeln;
END;


//CREATE_CARDS_TAB : Fonction qui va créer un tableau de cartes 

FUNCTION create_cards_tab():tab_card;
VAR
	i,j,k,l: int;
BEGIN
	For i:=1 to 13 do
		Begin
		GLOBAL_cards_tab[i].number:=i;
		GLOBAL_cards_tab[i].color:=1;
		End;
	For j:=14 to 26 do 
		Begin 
		GLOBAL_cards_tab[j].number:=j;
		GLOBAL_cards_tab[i].color:=2;	
		End;

	For k:=27 to 39 do
		Begin 
		GLOBAL_cards_tab[j].number:=k;
		GLOBAL_cards_tab[i].color:=3;	
		End;

	For l:=40 to 52 do 
		Begin 
		GLOBAL_cards_tab[j].number:=l;
		GLOBAL_cards_tab[i].color:=4;	
		End;

END;



{--------------------------------PROGRAMME PRINCIPAL---------------------}


BEGIN
	//GLOBAL_cards_tab := create_cards_tab();
	//initListe();
	
	kartest1.number:=1;
	kartest1.color:=2;
	kartest2.number:=3;
	kartest2.color:=4;
	kartest3.number:=5;
	kartest3.color:=6;
	node1:=creerNoeud(kartest1);
	writeln(node1.item.color);
	writeln(node1.item.number);
	node2:=insereTete(kartest2,node1);
	writeln(node2.item.color);
	writeln(node2.item.number);
	node3:=insereTete(kartest3,node2);
	writeln(node3.item.color);
	writeln(node3.item.number);
	new(premier_ptr_noeud);
	premier_ptr_noeud:= @node3;
	
	//writeln(noood.item.color);
	//writeln(premier_ptr_noeud^.item.number);
	//afficheListe(premier_ptr_noeud);
END.
