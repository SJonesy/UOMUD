package com.planet_ink.coffee_mud.Abilities.Spells;
import com.planet_ink.coffee_mud.interfaces.*;
import com.planet_ink.coffee_mud.common.*;
import com.planet_ink.coffee_mud.utils.*;
import java.util.*;

public class Spell_Claireaudience extends Spell
{
	public String ID() { return "Spell_Claireaudience"; }
	public String name(){return "Claireaudience";}
	public String displayText(){return "(Claireaudience)";}
	protected int canAffectCode(){return CAN_MOBS;}
	public Environmental newInstance(){	return new Spell_Claireaudience();}
	public int classificationCode(){	return Ability.SPELL|Ability.DOMAIN_DIVINATION;	}
	public void unInvoke()
	{
		// undo the affects of this spell
		if((affected==null)||(!(affected instanceof MOB)))
			return;
		MOB mob=(MOB)affected;
		
		if(canBeUninvoked)
		if(invoker!=null)
			invoker.tell("The sounds of '"+mob.name()+"' fade.");
		super.unInvoke();

	}
	public void affect(Affect affect)
	{
		super.affect(affect);
		if((affected instanceof MOB)
		&&(affect.amISource((MOB)affected))
		&&(affect.sourceMinor()==Affect.TYP_SPEAK)
		&&(invoker!=null)
		&&(((MOB)invoker).location()!=((MOB)affected).location())
		&&(affect.othersMessage()!=null))
			((MOB)invoker).affect(affect);
	}
	
	public boolean invoke(MOB mob, Vector commands, Environmental givenTarget, boolean auto)
	{

		if(commands.size()<1)
		{
			mob.tell("Cast on whom?");
			return false;
		}
		String mobName=Util.combine(commands,0).trim().toUpperCase();
		MOB target=null;
		if(givenTarget instanceof MOB)
			target=(MOB)givenTarget;
		if(target!=null)
			target=mob.location().fetchInhabitant(mobName);
		if(target==null)
		{
			for(int m=0;m<CMMap.numRooms();m++)
			{
				Room room=CMMap.getRoom(m);
				MOB t=room.fetchInhabitant(mobName);
				if(t!=null){ target=t; break;}
			}
		}
		Room newRoom=mob.location();
		if(target!=null)
			newRoom=target.location();
		else
		{
			mob.tell("You can't seem to focus on '"+mobName+"'.");
			return false;
		}
			

		if(!super.invoke(mob,commands,givenTarget,auto))
			return false;

		boolean success=profficiencyCheck(0,auto);

		if(success)
		{
			FullMsg msg=new FullMsg(mob,target,this,affectType(auto),auto?"":"^S<S-NAME> invoke(s) claireaudience, calling '"+mobName+"'.^?");
			FullMsg msg2=new FullMsg(mob,target,this,affectType(auto),null);
			if((mob.location().okAffect(msg))&&((newRoom==mob.location())||(newRoom.okAffect(msg2))))
			{
				mob.location().send(mob,msg);
				if(newRoom!=mob.location()) newRoom.send(target,msg2);
				beneficialAffect(mob,target,0);
			}

		}
		else
			beneficialVisualFizzle(mob,null,"<S-NAME> attempt(s) to invoke claireaudience, but fizzle(s) the spell.");


		// return whether it worked
		return success;
	}
}