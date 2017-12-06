import java.awt.Robot;

z = 1;
mouse = Robot;
mouse.mouseMove(800,800);
screenSize = get(0,'screensize');
while z > 0
    z = z+1;
    for i =1:screenSize(4)
        mouse.mouseMove(800,800);
        pause(5)
    end
end
        
        