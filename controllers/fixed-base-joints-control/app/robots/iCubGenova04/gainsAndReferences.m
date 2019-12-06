% GAINSANDREFERENCES initializes the controller parameters: gains,
%                    regularization parameters and references.
%

%% --- Initialization ---

% References for the demo with joints movements
if Config.MOVE_JOINTS
    
    % Postural task gains
    KP = 20*diag(ones(1,ROBOT_DOF));
    KD = 2*sqrt(KP)*0.1;
    KD(3,3) = 2*sqrt(KP(3,3))*0.2;
    
%     Ref.Amplitude = 7.5*[0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 1 0 0, 0 0 0 0 0 0];
%     Ref.Frequency = 0.5*[0 0 0, 0 0 0 0, 0 0 0 0, 0 0 0 1 0 0, 0 0 0 0 0 0];

     Ref.Amplitude = 3.5*ones(1,ROBOT_DOF);
     Ref.Frequency = 0.5*ones(1,ROBOT_DOF);
     Ref.Amplitude(1:11) = 0;
     Ref.Frequency(1:11) = 0;

else    
    % Postural task gains
    KP = 0*diag(ones(1,ROBOT_DOF));
    KD = 0*2*sqrt(KP);
    
    Ref.Amplitude = 0*ones(1,ROBOT_DOF);
    Ref.Frequency = 0*ones(1,ROBOT_DOF);
end
    
if size(KP,1) ~= ROBOT_DOF
    
    error('Dimension of KP different from ROBOT_DOF')
end