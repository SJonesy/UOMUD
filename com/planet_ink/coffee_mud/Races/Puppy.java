package com.planet_ink.coffee_mud.Races;
import com.planet_ink.coffee_mud.interfaces.*;
import java.util.Vector;
public class Puppy extends Dog
{
	public String ID(){	return "Puppy"; }
	public String name(){ return "Puppy"; }
	public int shortestMale(){return 6;}
	public int shortestFemale(){return 6;}
	public int heightVariance(){return 3;}
	public int lightestWeight(){return 7;}
	public int weightVariance(){return 20;}
	public long forbiddenWornBits(){return Integer.MAX_VALUE-Item.ON_HEAD-Item.ON_FEET-Item.ON_NECK-Item.ON_EARS-Item.ON_EYES;}
	public String racialCategory(){return "Canine";}

	//                                an ey ea he ne ar ha to le fo no gi mo wa ta wi
	private static final int[] parts={0 ,2 ,2 ,1 ,1 ,0 ,0 ,1 ,4 ,4 ,1 ,0 ,1 ,1 ,1 ,0 };
	public int[] bodyMask(){return parts;}

	protected static Vector resources=new Vector();
	public void affectCharStats(MOB affectedMOB, CharStats affectableStats)
	{
		super.affectCharStats(affectedMOB, affectableStats);
		affectableStats.setPermaStat(CharStats.STRENGTH,6);
		affectableStats.setPermaStat(CharStats.DEXTERITY,11);
		affectableStats.setPermaStat(CharStats.INTELLIGENCE,1);
	}
	public void affectCharState(MOB affectedMob, CharState affectableMaxState)
	{
		affectableMaxState.setMovement(affectableMaxState.getMovement()+50);
	}
}
